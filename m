Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626743;
	b=zE3i3dMALTRPs9bvOcJl9bEB5cXPTzyYII9ilmUckxZZmTQW7HclK/DXwB6Zxbx/kcbC
	 n2wrVxXauona1o7ASIV2E0lCZNCSATNRLpRnZLqZPpWIY0+DhEh0I/eouz/zQ+iKjeCnz
	 Jz9B9yIwgIZONbh6vJ9G5oqth9YrTuRa7kWbMkHL9TX1kX/pHC5hFuYijeTOqw2g5Glji
	 ePK8olCK7Y5Ftv4OEMZx02g8JwGEo5FoyFBvx0sJ1xDK61JMSuEJVGR9p19HOrlO72Krx
	 ae26ikcpAiPj8dmfQ7ZBbROaqtLuRCn1zFOAbPYf7IVjKQnodVH1dtQjommdc4gHMMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626743;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
	b=iBQVieD8Z9bTtaqzks4zXmVuLwdwp0GBoty2N6auBX6YuBR/jMjjDA6fxLNxJ5NF3Ml5
	 mw5d9Qb9Z+3YVcvO7IImsDKFenHV74eV1V1534qrwxBh4YqYQdIc8oUS8gyWz2TnZnz5X
	 eXntxmnFUohHK4HUOsbDBO+vBwPRTpsmjZImEuEUqmv315gyL9y5qr3E/soBJ6LrhJhDE
	 3iUfblbVbIyCxDtdOCjkn282vnXTUwmlDr2ffazlQIrZ+TN3aG55WPFqDd6ZyA+fV36VV
	 9NC3KzvGb5b0HU5yHwgQngbAT4/7V9K0icmL08tzXYbCzwRnABdXsHqY8RqbltyGvAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N054AAle;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AEA606A338
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 03:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9AEA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N054AAle
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso853401a91.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 19:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626742; x=1795231542;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
        b=R7q1sd9DEIURfxaDT2NykSU9g0LnjMpX/f7MPn5phodLLTeRofOyk+OAD6B+N8niZg
         kbFirbONb/kF04Bwk2/tl3lLzlB5jl3WWWFqzJV+FUY0LMhuJ5soE+8exN4dOgBl1jk6
         I5faS/KvU3L2OegHym3qiRgwyY2lJM/fpMgeR+h3GUO40kj0mg3Jj7bLEfi28kbbnG8R
         I3gJtH6OwxXGfN/kB9Qo/ZikXUp/RKDthxgrLnf/t6SzXf6cQAiHQsAZO0aMqEIGC1HB
         4sGLVeF/cKSEaR367BA8U6KMcX13u302Fgmnzf8PHBgDi9mKWEWzpZIG6MKlVvJ8amVD
         ZL/g==
X-Forwarded-Encrypted: i=1; AL+hErFU6KKmNNxEF+kma00JPNZ9rpVOXCLGi9IU74/VFZQuZ1hg033XOxd40CsVP+XmmZf40hOdMI4yabm3Cl9A@lists.linux.dev
X-Gm-Message-State: APuU4Z+yHkdgaBofRMGq5zkK6sSm5Q8zx8QcK6pciVIVSKPIjnVnj2HL
	t4IDDRzmGgG+I/CiCerYXgBe4O5ToiMExjFHBEfJHKfuCop6u/71djqSLWllJ0v9LXzCRGJRVg3
	rZzJHRnZXLHpBweh3H3rSiEOy5q59oBosn9drALwGMhAmqqpPzrzbcNon6Q2UhAGmHAqNBM6hYm
	95dPfo+s3B5kL2v6igvfV5PrSQ/Gw1mf4SEdOv5eHOxl5sslO89fWUFCFD3CVnqh4bMyOXkRIX0
	abcEXPImIV6OzN8pPlP3g9hrA==
X-Gm-Gg: AYBFou3P/2Wf7xzWjzoSiY6L86IyLxY+UoZV9BtmFcbHA8HAe6kHckfcJ3kXhpRHDKc
	ACLpRSNcAUPNNHffY7tZx4LBEqqzFVReXn9tHTv/4JdLjPnCNk4rM3RRxv5kEy1wAGKilek+J0K
	fvVhpRwO5ZAl76gv31T3chA+YnV+eFNOo+6msEqjXqlxm4fpeS7cCW7I6YLCqzfvMdZqiPpKETQ
	HCgNxvi46CImYBmYb+fhJL06SwKkuJjHrgCulPhOwEXzEvebQKNjWFZveU7VpgauSM/kJTfr/46
	BJ/PN/dFzvzlU0x94owJF63561f3Dl97YRzGZEMdDJV0/X4I6gso9uPFV4dWmdQBvEMwmcDVAzg
	2EYIhrDH9624puC7Ge8gvUV8xbOwn672rrlvvsQXEnHpExR9pS6A2hMjZSGobYYdZDjelgxgGez
	WiuiIgdFXwlDbchmxe3htbZ4V91OdEZPS6y+9UzRB7reg=
X-Received: by 2002:a17:90a:f947:b0:3b1:2810:dfdb with SMTP id 98e67ed59e1d1-3b1b0b86ae0mr4315535a91.48.1794626742035;
        Fri, 13 Nov 2026 19:25:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3abbe1asm3282418a91.5.2026.11.13.19.25.40
        for <linux-staging@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1895924eec.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 19:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626739; x=1795231539; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHv/pDEHGZwL/04gMWr3kX9bFGLJf7m3Va9lbS0UiIA=;
        b=N054AAleNxiAv7IcghtqBuvLSfcFdohfNRohwx7ZwMkr7WJ9EnmE1xxaCdBwgzIiOF
         qbeUixgG6jNxTBADVjOQtF3dYufgaJGtAlSi9XiimNUqM2/SB8ye+BS5sHKx67D6yqgT
         x81h4M33QQWKLCpvv3xCfyGD0o+fnO8lnUN4Q=
X-Forwarded-Encrypted: i=1; AL+hErH8j0HsGfxAfeAXMOsWB0U7Ip5B1BOTgZOGGAd+r9r6EWlrmTbVj5qyDFDHkMl3Pydz/TXJtwfVdSWqMpWh@lists.linux.dev
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr4605144c88.13.1794626738991;
        Fri, 13 Nov 2026 19:25:38 -0800 (PST)
X-Received: by 2002:a05:7022:3a87:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b5030980f2mr4605093c88.13.1794626738111;
        Fri, 13 Nov 2026 19:25:38 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm12632658eec.14.2026.11.13.19.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:37 -0800 (PST)
Message-ID: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
Date: Fri, 13 Nov 2026 19:25:35 -0800
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
To: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
 Gaston Gonzalez <gascoar@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu>
 <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/13/2026 10:09 AM, 'Martin Wetterwald' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> On Wed, Nov 4, 2026 at 3:20 PM Martin Wetterwald <martin@wetterwald.eu> wrote:
>>
>> On Thu, Oct 22, 2026 at 3:31 PM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
>>>> Hi Greg,
>>>> this is a regression introduced by aa125180c673 (via your tree) in
>>>> 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
>>>> 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
>>>> staging-linus would be great. Thanks!
>>>
>>> This is not a staging driver anymore, please route it through the proper
>>> tree after -rc1 is out.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Hi Florian,
>> Now that -rc1 is out, could you take the patch?
>>
>> I've checked 7.4-rc1 and I confirm the issue is still present.
>>
>> Thanks!
>> Martin
> 
> Hi Greg, Florian,
> 
> The file I changed (drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c)
> is currently listed with Florian as maintainer by get_maintainer.pl.
> But Florian tells me he doesn't maintain VCHIQ.
> 
> How to proceed now? This file doesn't seem to have any maintainer as far as I
> understand.
> Any pointer to someone able to take this patch would be appreciated.

Sorry for the lag Martin, I will be taking those patches from now on.
-- 
Florian

