Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1F2F2F
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 15:06:35 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id h3so17447357lfu.8
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 08:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ax4NjK8XwA1ohbPa662SFas+biBOwlGNHqnQ69auqV8=;
        b=jhpgXc8M4iR38j4MFOGx8d5eDvEq3d+VuBEvwo2EztQHHj2bj+D9qzwstMclvxVwRN
         uYkx3lSRd+6ubulZs90LexcOLSZShC9rmUOZgWZcT0UCjSkJ5Eq+RjzIh4KEjtbIoIjT
         qteh+kIfUou7KM1tm6cOpxe3DjDBmoucooGVIPE3xNPsc6NdnmVungrN22yq1P9DxHga
         fLiJFStM280kt7i1sEKTjgFjL8/2PNyCYHp8Ww92vJNWzcKK6+hysz5eXlJHF5awRLAT
         yxYH8kffX37VA1d2lXMaJfn1y5Cb782qoqOaGjPZDjlPST9pymngixKZiS0H1u5iFuly
         RmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ax4NjK8XwA1ohbPa662SFas+biBOwlGNHqnQ69auqV8=;
        b=UZn52Z6IZdQq8yV88hU+QnTbDHD3A0DNuJ/pJiblSYDRzzLi+Xxc5KVM4ySI1JMdDj
         5+XpHCxQUnf3Q5u+GeAvp40T56pYEh5qg6BY534Rl7iA9zFYd1Q0i6B59Q0YNVbEJRI2
         +J6Yc1ZZxl85cLDe83iNJeYEUMKhx6a3hlwzZwF+krP/4oZMxzZM9F6Mh4UZcD/4tRRC
         UdyqN93T1IhIljh7/BJzzXxtrZubezYS0Nn707wDDfLgGWiwEwZAr5ifHw0xSmfOvmHb
         AcjGZ7nv3SiJCzxl7x3sujpG+yjN2C+zshbeEb0SP+w1IGq5LMcYbwojCkMldB/gng9e
         L8qw==
X-Gm-Message-State: AOAM531APnvXyprnqtIw9upzX4o3kzMDhnsSmmhOEl6hxcW9j2Mk8c9H
	jHuC64xCnzthP7MVxnObGhQ=
X-Google-Smtp-Source: ABdhPJzIC/OMqVHYwx3wVPo6mHHn8DnIt0notOSFzK1CVHndztLcHi5iYrH7PqPv1mdEHa0jjrk78A==
X-Received: by 2002:a05:6512:6c5:b0:472:3b6:a980 with SMTP id u5-20020a05651206c500b0047203b6a980mr1476934lff.542.1650812793457;
        Sun, 24 Apr 2022 08:06:33 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.225.17])
        by smtp.gmail.com with ESMTPSA id y37-20020a0565123f2500b0044a1e1c6b37sm1043084lfa.53.2022.04.24.08.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 08:06:33 -0700 (PDT)
Message-ID: <c2296090-2e9b-fafb-35da-e01b025b53b7@gmail.com>
Date: Sun, 24 Apr 2022 18:06:32 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [BUG] staging: r8188eu: KASAN: slab-out-of-bounds in
 rtw_cmd_thread
Content-Language: en-US
To: Solomon Tan <wjsota@gmail.com>, Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <67e2d10b-7f0f-9c5a-ce31-376b83ffba9e@gmail.com>
 <YmU+cqEZfrGz5XsT@ArchDesktop>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <YmU+cqEZfrGz5XsT@ArchDesktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Solomon,

On 4/24/22 15:11, Solomon Tan wrote:
> On Sun, Apr 24, 2022 at 12:00:12PM +0200, Michael Straube wrote:
>> Hi,
>> 
>> It looks like
>> commit 0afaa121813e ("staging: r8188eu: use in-kernel ieee channel")
>> intoduced a. See KASAN output below.
>> 
>> That commit replaced the use of struct rtw_ieee80211_channel with struct
>> ieee80211_channel.
>> 
>> There are several calls to memcpy that used sizeof(struct
>> rtw_ieee80211_channel)
>> and now use sizeof(struct ieee80211_channel) but the sizes of these two
>> structures are not equal.
>> 
> 
> Oh no. When does this issue get triggered?
> 
>> regards,
>> Michael
>> 
>> dmesg:
>> 
>>  ==================================================================
>> [  422.214237] BUG: KASAN: slab-out-of-bounds in rtw_cmd_thread+0x1e8/0x430
>> [r8188eu]
>> [  422.214277] Write of size 3600 at addr ffff8881e149d200 by task
>> RTW_CMD_THREAD/2563
>> 
>> [  422.214289] CPU: 11 PID: 2563 Comm: RTW_CMD_THREAD Tainted: G C OE
>> 5.18.0-rc2-staging+ #47 94e3ca73bebf5b7fec506721475e4fff2a023bb9
>> [  422.214301] Hardware name: Gigabyte Technology Co., Ltd. B550M S2H/B550M
>> S2H, BIOS F15a 02/16/2022
>> [  422.214309] Call Trace:
>> [  422.214313]  <TASK>
>> [  422.214317]  dump_stack_lvl+0x45/0x5b
>> [  422.214327]  print_report.cold+0x5e/0x5dc
>> [  422.214335]  ? kasan_set_track+0x21/0x30
>> [  422.214342]  ? kasan_set_free_info+0x20/0x40
>> [  422.214349]  ? rtw_cmd_thread+0x1e8/0x430 [r8188eu
>> 91924fe1575bf49b9b37985ffde2c585d847446d]
>> [  422.214386]  kasan_report+0xab/0x120
>> [  422.214394]  ? rtw_cmd_thread+0x1e8/0x430 [r8188eu
>> 91924fe1575bf49b9b37985ffde2c585d847446d]
>> [  422.214430]  kasan_check_range+0xf6/0x1d0
>> [  422.214436]  memcpy+0x39/0x60
>> [  422.214442]  rtw_cmd_thread+0x1e8/0x430 [r8188eu
>> 91924fe1575bf49b9b37985ffde2c585d847446d]
>> [  422.214479]  ? rtw_setassocsta_cmdrsp_callback+0xd0/0xd0 [r8188eu
>> 91924fe1575bf49b9b37985ffde2c585d847446d]
>> [  422.214516]  kthread+0x15d/0x190
>> [  422.214523]  ? kthread_complete_and_exit+0x20/0x20
>> [  422.214531]  ret_from_fork+0x22/0x30
>> [  422.214540]  </TASK>
> 
> Sorry, I am not familiar with KASAN. How should I interpret this output?
> I see the paragraph above has references to rtw_cmd_thread. I assume
> that is its way of indicating that rtw_cmd_thread is the cause of the
> problem, but the one below refers to other functions. I'm not sure where
> I should start looking. I would start looking at `rtw_sitesurvey_cmd` and
> `rtw_scan_ch_decision`, which call the memcpy on the
> rtw_ieee80211_channel structure, but they are not on the call trace.
> 

drivers/staging/r8188eu/core/rtw_cmd.c:276: memcpy() call.

As Michael said the sizes of structures do not mach and the memcpy 
writes below allocated buffer.



With regards,
Pavel Skripkin
