Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8D3FC1
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 12:50:39 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id s3so26050518ljp.11
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rxmlNdlUfU1P9x2yEO9RufRY6ZMTXEHbwKbvIeBfIWg=;
        b=QOXny0/osgqA6UzlB1dRo/nj4oBlLuQxkEwHkmznxMXNCBaWVuAjtiWRGbn5epQ3q+
         vjNZ2vV9Ml3MFux+avJmWxIR8aiVl7+jL8K8Xq+YrbVlP40bmydtjikMhemhLa9LmrLm
         Q+HRmjfJyALVIYzDjEWx4dbB6rT0UT2r9X65jM7gzdN4b74lhmbpPH3WJGhw+VR3aveO
         C7U63WMcXmzLDIbzIq9UPS85fCd91X3YV3Tarq+nQDuQlPOKoqhHcrb7jOmnQUXjKOli
         ymMnOWUi4Y5Je/gnpZV3Awb7/29Qbcad71QN3YKuNx4l9J25ANCr7ktOynDWZ7KVU58g
         SSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rxmlNdlUfU1P9x2yEO9RufRY6ZMTXEHbwKbvIeBfIWg=;
        b=ssFRj8Mv784jvyHEOqpjly/eKChWlNrjD3L+qtAQDs2KL/uA+xKbVbhW9m19GldbgU
         tWb0NbuB1mTXjKDRe6mB7R5lBcqA1aE/Pc+IJq04UJ27elqfypb7vMVWgeEi3ICcd/2Y
         OQVOzekFIC2SKPLXUCku9nUamG21IHZF3TdNn5pFdyMRiUZOxQoj0HOymW7PI5QF/mTz
         MYNhM3+el3liVXEaC1nQsF2F5Goj7UsHBssmYX4ma0umyTS0QlGx9C4Y0xuqM2U2P3Fv
         qck2NNKEVnqoqbKPIcYonlKCWXp2RhOM5gACWbKtL+zoIh3aqq2rs0jjUjMOo+Se/RM5
         m5Aw==
X-Gm-Message-State: AOAM532ekGgX9hlYbWhCuUrCiLyG/L8o3W73ELBMRo11hIAtkBvZRl6y
	MNtX1gjEV2jdmnAjZA52S+I=
X-Google-Smtp-Source: ABdhPJwEMmgrzP4gk9QRJw9/Lxj83pvzB66lS/NYtqpAsAqHbk/OwI0irZYb1eiVs9S4hgqnORV6cQ==
X-Received: by 2002:a2e:a5c6:: with SMTP id n6mr23634756ljp.204.1629636637250;
        Sun, 22 Aug 2021 05:50:37 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id l2sm1192534lfk.84.2021.08.22.05.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 05:50:36 -0700 (PDT)
Subject: Re: [PATCH RFC 0/3] staging: r8188eu: avoid uninit value bugs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Martin Kaiser <martin@kaiser.cx>
References: <cover.1629479152.git.paskripkin@gmail.com>
 <10584649.zhyk0TxWeL@localhost.localdomain>
 <ae27d6a0-dc00-459f-7b36-acf7f4c08d72@gmail.com>
 <2327383.5TodInGmHT@localhost.localdomain>
 <435eea22-da31-1ebc-840c-ee9e42b27265@gmail.com> <YSJFhmTs74PUyo8b@kroah.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <e5d189b7-15b2-8cc3-1e84-021dc5ab51af@gmail.com>
Date: Sun, 22 Aug 2021 15:50:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YSJFhmTs74PUyo8b@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/22/21 3:39 PM, Greg KH wrote:
>> 
>> Yes, but _rtw_read*() == 0 indicates 2 states:
>> 
>> 	1. Error on transfer side
>> 	2. Actual register value is 0
> 
> That's not a good design, it should be fixed.  Note there is the new
> usb_control_msg_recv() function which should probably be used instead
> here, to prevent this problem from happening.
> 

Thank you, Greg, for confirmation. That's was the point why I started to 
write this series :)

I think, usb_control_msg_recv() won't help us with this problem, since 
all rtw_read*() functions return an unsigned value now. In future, when 
driver code will be fixed (ex: a lot of void function, which can fail 
and leave passed pointer uninitialized) we can move to new usb API and 
then move driver out of staging :)


With regards,
Pavel Skripkin
