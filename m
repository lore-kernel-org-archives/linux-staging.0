Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B652972
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 14:40:45 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so17717362oti.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 07:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5pMJF0R1f5a3Y5pbq2MLqTa50aY/y2qCjSHnmGqc3k4=;
        b=nWmIe3T3nyWbZPeZcdKs2pUTmasQYtcUkwKEFF53UI3dUDwOVhLS8YFusah9MRjKaO
         OlNd5ZdHdroaeIGMILoLsGKgMouU5LAqcyjfKbSsP4M9Dv09ljqJwjK3MX00yp/UN413
         4/QnWeOpWeV7LpMxiihdmwuCl0JQbDZN+IRMy9S9tiaYvPogd5dRcF//D3h19pF/go/y
         rBm4lp34C4dNJAF3rsfAE1yqMsNdS8I20PzuyMcN0qu+osblZK8snn6M1CokPHYsq61h
         gHJ1f56RNAfvHH86Qn5w3RSAI9SlOWpRyrw6SZdmOsjjSdApbxeIF4zw8gZ8g+9jJp+C
         7fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5pMJF0R1f5a3Y5pbq2MLqTa50aY/y2qCjSHnmGqc3k4=;
        b=thzyvk+YaTJVAJUXi5gH/IUv8OKH/ygGGQhp0dTS1Q+zizm6F84p5/qC2sxWcNt+IQ
         05WXdsUytDv93TmFZMwz4kOblJZMDCqouHkGSDb/Md9eEnp2bWjG5HEcMXIIaTVa7scD
         BMdgN9EBxGtXhCa/THMyTSwH7GGDwqM2WnpyUcDP2K0zdt8qBrHcgUjTAVW92lTfzLfk
         y4G+dWghx03ptFGUrgGDipW/Cf17EUcTc3fdKfnpjzeHEjhpHWOQdoRsLFmPGU/VZ1UD
         JXgyJYgtVVyyGTzA/nhFlvYRHWlaqlm2apyz0J2C92tv++m2wiQzIhOosG/dPkGth6K7
         lgYw==
X-Gm-Message-State: AOAM530QVeOaBe0enGBOrhO3fZfWvx8AnJTMWkXY6WzffMV0gaqy0Skb
	nLDkelhW9cJQMGi9r/rHYqeu+za0XD8=
X-Google-Smtp-Source: ABdhPJwTQOh1Ox+YwgBijrR6XSUaReg4shsrBu499aRTUyO/IVmcEmZhuDOLqZOoaxCD0AYVyl/OxA==
X-Received: by 2002:a9d:2276:: with SMTP id o109mr11376896ota.151.1627915244703;
        Mon, 02 Aug 2021 07:40:44 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id a193sm1742648oob.45.2021.08.02.07.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 07:40:44 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: kernel BUG in new r8188eu
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
References: <80042e9f-6811-38f3-010b-1c0951ba88db@lwfinger.net>
 <cef19337-5ff3-c0cd-33ef-4f9990bcd4ec@lwfinger.net>
 <YQfKohnSRWHjlht6@kroah.com> <147993920.vpeT8VCmXh@localhost.localdomain>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <dad0fc63-5419-ac38-3c23-110e4063bbe6@lwfinger.net>
Date: Mon, 2 Aug 2021 09:40:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <147993920.vpeT8VCmXh@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/2/21 6:45 AM, Fabio M. De Francesco wrote:
> The following link points to a device that seems to be supported by this
> driver. It is just $4.99, but I'm not sure whether or not they ship to Europe
> (I suppose you're here):
> 
> https://www.amazon.com/gp/product/B00L28AN88/ref=ox_sc_act_title_1
>   
> About this item:
> * Chipset:RTL8188EU
> * Standard: IEEE 802.11n,IEEE 802.11g, IEEE 802.11b
> * Supports 64/128 bit WEP, WPA encryption
> 
> Otherwise, I think that the following uses the same chip as the above.
> However, it costs a little more and, above all else, I'm not really sure if it
> works with r8188eu, since they write that the chip is a Realtek RTL8188EUS
> (please note that final "EUS"):

The RTL8188EUS chips use the same driver as RTL8188EU. In fact, the one I am 
using is the EUS variety.

Larry

