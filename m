Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2D42F32
	for <linux-staging@lists.linux.dev>; Sat,  1 Oct 2022 19:03:24 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n10so11408257wrw.12
        for <linux-staging@lists.linux.dev>; Sat, 01 Oct 2022 12:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=H+riS0rmuKdu7anjZeYxK2cPzINf9PIROsaI2sQkO4o=;
        b=cVpiZqgUzavLQMKS7/aktSzADWkW/PdWIcoxrTRtw/iqtMibb6/l6LfQjD2F7YUwhj
         W9WNqbcKewW9ut0YOnaZvDifxlzSE6LQVWqhOYA1uRYlJ1NsHP0rTSado8XJrVTmJWXw
         JEnFjERGbd3Uky3VFAXjtqBWLhXziJ+NG9Wy+6kZlyrRxVtqANbfjMhOfH/q5ysZIYLB
         /oy0By3c2JEeNG3Ymqjl+3RmCG5d7P0hpanw/g4m0Yyx0px7+Z4EyOv1/JoLE+HuMYXL
         doIoQrflf+ybVNTs42mJAs479arxywfLCtgBMkW/TioqebT/KKd42fMRtHsjdsLQf4nq
         kMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=H+riS0rmuKdu7anjZeYxK2cPzINf9PIROsaI2sQkO4o=;
        b=mj4UR3HPmtsWkIB5PkZJOXxU17KE4qbdDfzAhuyUJiBt1umquOJkNV8RSXw6D4ZA1i
         5J4elBzX3YffsymbPMpIESGAX/szQYtgU/3ZCwIK7sGeuI47Kas00HFEqrC+PdgP1Rfo
         vAYgfWf8Zbgm4lgdFc0HYIMSn2/47bo9O00NuMbGH0YlDlTmaj76R4HXxNLxXMi95NT5
         a/LGUqhMoinqQlRFqwMrdeA6reengM0c/x7L25x+zZFaFXbdSCHQhHDlp8cjOC3R1V9k
         b0nJNDGM0yO+s73207ZdtS3QpyJt+8d806gGreU2uk4SaZ6XckxKVEU35IQy28iatAnS
         eqqg==
X-Gm-Message-State: ACrzQf3obOccT5VsZbc6cXzT6zH9J7dqRxsjw7I+7We+nTwwdCTyoiam
	t9vqHOEr4q+e45Lc/KlSVsXqKgBaHImQrQ==
X-Google-Smtp-Source: AMsMyM4guzO9XQTQeqOIDfw9RUfBJTXiNCBxdGAE2Y0XMUOjOdcESiJmwQ0xMBrhl59cuRuXCWDbRg==
X-Received: by 2002:adf:f58b:0:b0:22e:3c4:cf83 with SMTP id f11-20020adff58b000000b0022e03c4cf83mr4732456wro.379.1664651002459;
        Sat, 01 Oct 2022 12:03:22 -0700 (PDT)
Received: from localhost ([105.184.5.160])
        by smtp.gmail.com with ESMTPSA id x12-20020a05600c2d0c00b003b51369fbbbsm11511724wmf.4.2022.10.01.12.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 12:03:21 -0700 (PDT)
References: <20220928075324.1605-1-joash.n09@gmail.com>
 <YzQALwjz5VT0uCyB@kroah.com> <87r0zva18v.fsf@gmail.com>
 <YzSDSNDd/IIdMeiq@kroah.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Joash Naidoo <joash.n09@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 dan.carpenter@oracle.com, straube.linux@gmail.com, paskripkin@gmail.com,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: r8188eu: fix too many leading tabs
Date: Sat, 01 Oct 2022 19:48:19 +0200
In-reply-to: <YzSDSNDd/IIdMeiq@kroah.com>
Message-ID: <87ill3mkxw.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed


Greg KH <gregkh@linuxfoundation.org> writes:

> On Wed, Sep 28, 2022 at 06:20:28PM +0200, Joash Naidoo wrote:
>> > But also, shouldn't you just be using the ip_hdr() call 
>> > instead of doing
>> > the crazy cast above?
>>
>> I would need to investigate and test first before commenting. 
>> If a change
>> had to be made, I believe it will go in a separate patch?
>
> Yes, that would be good to do as a patch series.
>
> thanks,
>
> greg k-h

Hi all

I want to investigate Greg's suggestion to replace the original 
code's iph cast with ip_hdr(). Looking into the ip_hdr() function 
it seems it effectively casts skb->head + skb->network_header 
property (See [1, 2]) whereas the original code casts skb->data + 
ETH_HLEN [3]. My goal was to use printk statements to see if 
they're equivalent before making any actual changes.

Could anyone advise to a high level action which will trigger the 
dhcp_flag_bcast() function, as seen in my patch. I have limited 
knowledge but I would imagine this function is called when the 
device broadcasts an IP address request from the DHCP server. I am 
using dhcpcd as a client and I have tried to manually trigger this 
action by deleting device's lease file and restarting dhcpcd. 
Among trying other basic things, I have been unsuccessful at 
triggering this function.

Looking further up the code at the rtw_xmit() function [4], I 
learnt the following. Perhaps understanding br_port may also help 
me.

	void *br_port = NULL;
	br_port = rcu_dereference(padapter->pnetdev->rx_handler_data); 
	// <-- this returns 0x00

	if (br_port && check_fwstate(pmlmepriv, WIFI_STATION_STATE | 
	WIFI_ADHOC_STATE)) { // <-- false because of br_port, second 
	condition is true
		res = rtw_br_client_tx(padapter, ppkt); // <-- later calls 
		the dhcp_flag_bcast() See [5]

		if (res == -1) {
			rtw_free_xmitframe(pxmitpriv, pxmitframe);
			return -1;
		}
	}

[1] 
https://elixir.bootlin.com/linux/v6.0-rc5/source/include/linux/ip.h#L19
[2] 
https://elixir.bootlin.com/linux/v6.0-rc5/source/include/linux/skbuff.h#L2819
[3] 
https://elixir.bootlin.com/linux/v6.0-rc5/source/drivers/staging/r8188eu/core/rtw_br_ext.c#L611
[4] 
https://elixir.bootlin.com/linux/v6.0-rc5/source/drivers/staging/r8188eu/core/rtw_xmit.c#L1670
[5] 
https://elixir.bootlin.com/linux/v6.0-rc5/source/drivers/staging/r8188eu/core/rtw_xmit.c#L1598

Thank you all for your time and support.

Kind regards,
Joash
