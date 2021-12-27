Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB08173
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 14:15:39 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 131so14508933qkk.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h43JvTBlx1L+3dM0ub2O2zsKi5NsM6c2ynNG6CbQN/4=;
        b=YX0IU2N5DerKdWWKGe8M0SP0hg9teNS0p2rrzUg71LX7A/PF2NomQOTaWMfi/XIJ0f
         H5Vxp4SApMKAV7VxPRkcDk0Tj0Hh05svKkp5B2bJ2BK2JAVKKLLqxdllZWA1PZ9TA7CC
         cf5Cyl18uTlvRf1xBC1FP+ok24WNcjSz44PkiXaf7NLci+YCH0UmvlDXx57Cw8tYV01x
         coaS7ZX9//50ZjNfkVQLn3JoM9puRu4Gvy5RZTJaSNBTi6DjJ+NLP+cUQwVFGWC0qH0R
         KuJ2imHsLAQMKyOn4IwaBPPiHTMyLtMXmQFy3o0XcLOmP516Z7FwHDGG6m/n3ACvBTrk
         Hl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h43JvTBlx1L+3dM0ub2O2zsKi5NsM6c2ynNG6CbQN/4=;
        b=hTKZ2IOGNLsK5aFOlppYR/kKkgN05CCvxoKebCiZG3kppvObZiAr69qtPdE5DZr4Gx
         XRcjsu1RUVILIFb0a/9qFePYyqrT28VxTKPLhhwjoCBGnpovh3QnQdBApCvuwfMtX4i2
         /ZLurN1LGQgD3zr4JhvDoDNvxR3gWIzxEYumgOXfbWfJMA+LMFIXShkuU/0OwVWUGjGn
         1f7lTj94VCZS54KcnKtlySELmzanE6hlhDzxb5U/UhQi8YMYkCq0kfYEHJFJD4HHk6J1
         ttMZXRc/Yts7sW5zEZQstc/uB8WhRK4Wv1bI7M68eMCOoSJHChEVAEpYpGcj8/JuftJ3
         3Mcw==
X-Gm-Message-State: AOAM532c6KiujxwAwuYIbOc6Xg+W72vouIL0j+H7MSQgdLfl0RUcGmQA
	Ai2sZA1k9tuMLXIJ6DIkSVuf9g==
X-Google-Smtp-Source: ABdhPJyuQB7j0MefIDDSMOcvWJvu999UfXWsuNzYlMVJnLoYCYBkzbYNFG3rtp7qOXELlXjPhmFC7Q==
X-Received: by 2002:a37:a803:: with SMTP id r3mr12411162qke.501.1640614538649;
        Mon, 27 Dec 2021 06:15:38 -0800 (PST)
Received: from [10.0.0.27] (pool-96-236-39-10.albyny.fios.verizon.net. [96.236.39.10])
        by smtp.gmail.com with ESMTPSA id j16sm13671313qtx.92.2021.12.27.06.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Dec 2021 06:15:38 -0800 (PST)
Message-ID: <152c8d76-af2b-2ea3-4f15-faf2670d8e73@sladewatkins.com>
Date: Mon, 27 Dec 2021 09:15:36 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] qlge: rewrite qlge_change_rx_buffers()
Content-Language: en-US
To: Adam Kandur <sys.arch.adam@gmail.com>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <CAE28pkNNsUnp4UiaKX-OjAQHPGjSNY6+hn-oK39m8w=ybXSO6Q@mail.gmail.com>
 <YcnA8LBwH1X/xqKt@kroah.com>
From: Slade Watkins <slade@sladewatkins.com>
In-Reply-To: <YcnA8LBwH1X/xqKt@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/27/2021 8:34 AM, Greg KH wrote:
>
> - You did not specify a description of why the patch is needed, or
>   possibly, any description at all, in the email body.  Please read the
>   section entitled "The canonical patch format" in the kernel file,
>   Documentation/SubmittingPatches for what is needed in order to
>   properly describe the change.
> 

hey Adam,

this would likely be it for both of the patches you submitted.

cheers,
slade

--
This email message may contain sensitive or otherwise confidential
information and is intended for the addressee(s) only. If you believe
to have received this message in error, please let the sender know
*immediately* and delete the message. Thank you for your cooperation!
