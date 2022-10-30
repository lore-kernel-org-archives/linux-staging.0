Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990676127
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 10:40:20 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id f5so1389040ejc.5
        for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 03:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGFd6yEFbbRiXKkguK7e/PC3bOLVDfqzNL+us0Fp3Nw=;
        b=k1bbyvERjl2SJ7iZjkPa/XVKDX+KQH1w5Kw2KxyUGtiUo3FHtc1iIAYcP7La6leXmK
         Jl9wKx2w+iwRYgoNcJjQLCJKc3Y+M+Jpg0+TW7rVodmiP82Tf7r/zP1Hb+f4wft3ePuS
         A+xMezo1Fk3JewfYq5Z3CGfXbivBpfHkoRDCKNslpj3NSnYUZegN4riDCmRnMm5ojvTx
         JB4qTKcGsazFomvzEevT0SDQB745r16osIj/Ghbagz8c31k/Ca8vjSn+w0GY/LnOpLyL
         olxAFD5PTcAtaI34st8Zge3DwCPIRfMQIxrEuaWCs9MBmtqqrZm+unXwYyqqIOW8uFAx
         kNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGFd6yEFbbRiXKkguK7e/PC3bOLVDfqzNL+us0Fp3Nw=;
        b=FCRQT72JTw5Pqem8mumhkFSvZ/jCdUXcN/RrUbLBHoZq6XcWaeRHiTuOmRrUgOYfKQ
         GxvLxlECW/jjRvAR2JeCV2C488PXkgoI57Vy0pJ9C+4gJPK0/4w4OmNnB7XWlYLE0co0
         61WEvn0S82caeuLzcCro7HzuHHWjahJL9sV19iEdZ+QJozZ6Mt5tARKyRJagVzLecw5h
         tWPgGI7uq1P3bf3H1mERLC1eDdM1SUUPQuZq6kjio9M2DEKu6L1q1rDHn1+zo1dSX7ZC
         Gj/Hv1k5HjiMT9sfeYKxiq9PhAFfaKlcumS5JtJGZuTEnvpIyrlGqBPX72IrQsVaF9DC
         3Kag==
X-Gm-Message-State: ACrzQf1gVdbde4Tk7frPRkAGXkc2sffxukYqaYtNcvVsZoZD6P5nnSxq
	281YpRYMKXDx52JjUc/hlvE=
X-Google-Smtp-Source: AMsMyM7Kb7ZzSXTbaaJeHzqj8oZ/v5QY3duAyytKC6PUEv42ZpHcu2spyBVa0eYv34wjauJ2x/w/8g==
X-Received: by 2002:a17:907:78a:b0:78d:9ac7:b697 with SMTP id xd10-20020a170907078a00b0078d9ac7b697mr7499697ejb.457.1667126418899;
        Sun, 30 Oct 2022 03:40:18 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id tx8-20020a1709078e8800b0078175601630sm1711531ejc.79.2022.10.30.03.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 03:40:18 -0700 (PDT)
Message-ID: <cc1c4548-984b-a40e-c93a-7e179d64912f@gmail.com>
Date: Sun, 30 Oct 2022 11:40:17 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: r8188eu: use min() instead of ternary operator
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221030081020.8533-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221030081020.8533-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/22 09:10, Michael Straube wrote:
> Replace a ternary operator usage with the min() macro to improve
> readability.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 8516e253bb03..22aab3f986b4 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -3568,7 +3568,7 @@ static int rtw_wx_set_priv(struct net_device *dev,
>   
>   		if ((_VENDOR_SPECIFIC_IE_ == probereq_wpsie[0]) &&
>   		    (!memcmp(&probereq_wpsie[2], wps_oui, 4))) {
> -			cp_sz = probereq_wpsie_len > MAX_WPS_IE_LEN ? MAX_WPS_IE_LEN : probereq_wpsie_len;
> +			cp_sz = min(probereq_wpsie_len, MAX_WPS_IE_LEN);
>   
>   			pmlmepriv->wps_probe_req_ie_len = 0;
>   			kfree(pmlmepriv->wps_probe_req_ie);

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
