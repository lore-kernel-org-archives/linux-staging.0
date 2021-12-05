Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF02C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:23:18 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id b40so19566487lfv.10
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uFaSJUqtbkqjrLraqOpRDFxq6XMUSg8P8xGe/5qj4Qo=;
        b=HInyItokzsY7cg2aHn34yO6zRn2JEmzNtqBKaIsLft3KGMWo9a5OSO+s6QBchmq3Dn
         9vfXtyAWv38GdlYpxxdZnNzEMDqARNMnvaZjfmH4roXxc2xmHXFWgOamd0tnnIQJd93x
         iSiug7s0CrpRwDES4pJ06D93u1JJqp8FFggbGkuF+/BPN5gIY2wxKafWsvE5hWx5PIUa
         DGHEyXLtFAS/MdMDC7iWCGLfloI/69oBopyUIjc6RbPYJK0TK3ul0eKQsx+pBy1ZEtsi
         ByE4KfIb/R5HPmaL87daZTeSFkyqy+SL9XjX/cky5acrFb6j+74owgfUEZ5LY84/+EUk
         AE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uFaSJUqtbkqjrLraqOpRDFxq6XMUSg8P8xGe/5qj4Qo=;
        b=ts1pV8SFOSWYWxeKLUcrr6BlUFUSv8WLfch31ZBwut8H3zO9Q9riy8W7Tb+l3F2047
         86/1dnV7MWQ6FiQiIJujMGF1rRf/TNd9ZSrrw9TPBGqKU+zOl8Pbk700j6Rgo+IRPt34
         Gdi8GXCkPBi7+vHzAGI7MfddxgZMib2PQvS/hl6bEGGzibhCYdvXZOk66oOrBaY/ImPP
         m4E/pUeEzWcA6mJLsH8U0daHJJ/K5YQthi85FDDhOjLrT08p8sBr/MFclXKMSOMJ8seu
         n5WT6s3JHodCTm36ukz326azpgu74l3nY+rNTZgdbgmUr7AQLgk3K+ugzYUg1bpkEmFI
         iQzA==
X-Gm-Message-State: AOAM532f88E99kCTmL+1zyHE9HdUow4jeNg1H/7YJUWjW9GG8/arP9sz
	Jy8NAZ9Z7QUgTgsKEOSAw+s=
X-Google-Smtp-Source: ABdhPJy/vmMTG7ZhLJA8zWPlGnpmlOtIczIOY6wOIvh4/R3cFSFlimwjHYDCtL1GBBd3rJUYlZp9dA==
X-Received: by 2002:a05:6512:150c:: with SMTP id bq12mr30946752lfb.687.1638724996270;
        Sun, 05 Dec 2021 09:23:16 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id u7sm1144780ljh.49.2021.12.05.09.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 09:23:15 -0800 (PST)
Message-ID: <51a14a4a-8385-b155-a16f-b4cc8b0096c7@gmail.com>
Date: Sun, 5 Dec 2021 20:23:14 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 12/12] staging: r8188eu: hal_data_sz is set but never used
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211205135919.30460-1-straube.linux@gmail.com>
 <20211205135919.30460-13-straube.linux@gmail.com>
 <197e167b-2225-3593-dab3-4f1f61331de9@gmail.com>
 <b3886219-9a24-c119-fe10-12e5e7c6b139@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <b3886219-9a24-c119-fe10-12e5e7c6b139@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/5/21 18:22, Michael Straube wrote:
>> Not related to your patch, but not returning an error from this function 
>>   looks very dangerous to me.
>> 
>> adapt->HalData is used in GET_HAL_DATA() macro all across the driver 
>> code and nobody checks if it valid or not. If allocation fails here, 
>> than we will likely hit GPF while accessing hal_data fields.
>> 
>> Maybe we can embed struct hal_data_8188e instead of storing a pointer to 
>> it?
> 
> Rethinking my prevoius answer, embedding struct hal_data_8188e is the
> better solution I think.
> 

I also think so. At least, it looks like this is very core structure and 
embedding it into struct adapter sounds more reasonable.

Also, it is one step further to make struct adapter more consistent. For 
now it looks confusing: some of privs are pointers and others are not:

struct adapter {
...
	struct dvobj_priv *dvobj;
	struct	mlme_priv mlmepriv;
	struct	mlme_ext_priv mlmeextpriv;
	struct	cmd_priv	cmdpriv;
	struct	evt_priv	evtpriv;
	struct	io_priv	iopriv;
	struct	xmit_priv	xmitpriv;
	struct	recv_priv	recvpriv;
	struct	sta_priv	stapriv;
	struct	security_priv	securitypriv;
	struct	registry_priv	registrypriv;
	struct	pwrctrl_priv	pwrctrlpriv;
	struct	eeprom_priv eeprompriv;
	struct	led_priv	ledpriv;
	struct	hostapd_priv	*phostapdpriv;
	struct wifidirect_info	wdinfo;

	void *HalData;

...

and even why Haldata is void *, but not struct hal_data_8188e * :)


so many questions and so few answers....



With regards,
Pavel Skripkin
