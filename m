Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920876;
	b=xnqBs5gCfXAot4Ccu2e+TVpEOLmeONOmndTq/1xqer4flI7JJrI58EsFiGviJDrz8/XE
	 iTn0MptxrdNEClMOnf2Hl96LH9s9cgB7rhpw63PaMdzuJubrtuG1tJkZ5JeeIoMx7lcbK
	 fIuT/6/lrmQcObpJ0ehbEhbqnYz+VE6IiduDbMm4YyJAjN44PCj8gFkc86rWyNic1Cc8R
	 w4Wp4BombKKUClRi/yBKTMRahlxhWP++2eraM92ad/jSQLL73m/GT6Tw4DZv0s4bDPjlm
	 zsqABI/O0mA2EXEY2YpJ0MFZobwGHt3B4yIFcAlJRlrr9JkiptSzIaCarGeLuN7/6qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7DJk0IhM38ENV4rjdcIdtMGuR5PCfXbmy3NasqzQYOc=;
	b=2wSMLODqRBIiZJVHSEIZHG11hRGkXPzNQEebrWYPF8DHzCSbs9htuKYz/PenvzzGOy3C
	 Or7dC9rtEUvgbQ8G48dujSJmA1nKJNWaeXLK8Hjl79WjaMSjutXBflE3d7jvZscOjM9Vz
	 ZAVPGZDfXUhLzFAzHYjEp/QCEL4/s2gKx8TZuzBp1RmkN0eMJEwjPPltezhS0B39fdRsV
	 ixNqZWsR+A8LsTH7BexYeoqKF1gNP9wxC6GMhSapgL6cElcp0cwY2jTzj1fzOGdYO9jtH
	 tAEd/lLO4JFLTUw/9DrJhvct5htJBAo950SpeWxH2yhzE4ei4slibEJuZoXzRsPauUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfuGjRrx;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99A9606A8A8
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 13:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99A9606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfuGjRrx
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso446912566b.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 05:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920874; x=1795525674; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7DJk0IhM38ENV4rjdcIdtMGuR5PCfXbmy3NasqzQYOc=;
        b=IfuGjRrxgvu5DBeIjQbfkjJ3NikJTh33th/tUEKkdQKAGeoj9TvMh6kzAsDCeouoSC
         eUYGT3Spvqmu/DXOE92m5NTbZ6grmjuXniTFbK70Df2sR2JQFPVCFd8nAnuZurZzWiOy
         N1s51mucDF2B4D7xxAtUzdBtkYBaLLGYG5R5IiCjVk9zbpkoLfmfevBCrVpaSElMTpXn
         SNLIoI0PYThA98hNJC3rUA8dzOijtczyF51n8+0tBvZBgu1GtxH2KOrgtjAAj1cszk48
         zY6HyPxerX3Xsn1owtp1X1bFmbgcm+rZUnrwFr1JeIMpY8d9IvPzWci5mWR6/gp2rNyg
         2HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920874; x=1795525674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DJk0IhM38ENV4rjdcIdtMGuR5PCfXbmy3NasqzQYOc=;
        b=KJD1A3wKmoyOCsfZtGPow6N1AIpjvh7VydCD2CKr9ht9HzV/IGrsbJCa30esRqO/7L
         xl3AoD2lYyVE3EkrbzAs4ZJyBIE4zeypbgTQxV2A24JaxPBW2NosbZbwmhLQ3GxiPyVW
         3x9Hv3Q/zi+Kcj7RDXGjumkrifxPiZzXKHgq2pHDixKUSA4Idt9SriKgYcpb38EBIDZy
         F09xA1bGpr5HThPcGZx3m501uIycRKUIJBRFLdPFaFdu0NCt1cS7om8ovA1PXDE8h2Es
         9nm5Qpj5/6G2fT8Ojb093SWATD24zKXaS8/ocPCxyZx29rRA/6JgBB2mT2wqBbYcuywH
         bzUg==
X-Forwarded-Encrypted: i=1; AL+hErFajHcJtuZcI1OyVTzkhiflDA8/ykN+V7IyepjE/XGY/07IWZvH6wFPzuifnCgPXWIIVBz6/INFH3PLwL9S@lists.linux.dev
X-Gm-Message-State: APuU4Z/X6nrZ6BZFdNogsNRqUFPktjTAjK9GfuqTytonjCg2/+jsQfER
	EHkfR+BzY9jFel8sTBrxVsSxVL6PgrkKZirLGLIdDtSt4Xng/ZagQ1dn
X-Gm-Gg: AYBFou1Z5yLMSqYWsaRtz0Eud/WewOm/Inh+oD4yxi0xE5fvXRRcwZaa+8Ip6EpAO/Q
	D5dYllc/xYKtn+KyjpsCRCs7P4m3X8d7KXOjKssH2tJo0KBv+6KrVr+BmRX0D6J8YaTKRGTAX51
	YadClJvGoCw8rSVMbzKEOTodeCogDv6Zw08Pks3PnZnFn1s1AegU/336wcEpatHYt2Gwgnc+Zd0
	faadimmOfwh0Fkv11Xq+lxVsM10mRy5Cvk842zaRcuJvMuiUWLnwLAFptApe6KAPqSq0sArcMHG
	FhnX66jVJX0dHhk4t9YWQZjr8SjAl9f6/90YNu2IBp/YszSOaINsWvb7/JqYbE0K8mN/Y5IGG5x
	2yf0BdzjVPFzpTePizByQNlzU4QaDsA/D07UbtSCtnR8Bcj7lic56txKwJmS0p3NnSfw0LA2Rbi
	asIXQ5ill6miB5ydsQ/MX3yDTj4lBDZroJEekw9W1mVU9y6Hs+g17gDUgQmU3J94eto1oAB1Jhq
	IAxPHnuYdEBTibbTGKNLHShTYwRORy0zFjadmns6517PFx0gDnaydz99+wNbsrAhpD2ZSCmqem/
	KHQHVVwRV8xV6zsFikz/880oZDTcbznD5z+LMnwvSla4pmQ3ycP503K/3ni0UHjH0/zP0imCN2J
	eiQRtZipOVS4owuYOLD0j1Jg/k9W65TmSCz8b8RBQWNyZKHgCVbYy4mQF8ViYvOzufjU=
X-Received: by 2002:a17:906:ee85:b0:c4d:2895:e492 with SMTP id a640c23a62f3a-c509636a10dmr1086944366b.21.1794920873943;
        Tue, 17 Nov 2026 05:07:53 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50b13a2ae7sm396508466b.62.2026.11.17.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:07:53 -0800 (PST)
Date: Tue, 17 Nov 2026 16:07:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2] staging: most: video: Document locks in struct
 most_video_dev
Message-ID: <avxRpY8InfnNtkvE@stanley.mountain>
References: <20261116183355.22563-1-patelshivani2283@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116183355.22563-1-patelshivani2283@gmail.com>

On Tue, Nov 17, 2026 at 12:03:55AM +0530, Shivani Patel wrote:
> checkpatch.pl reports that list_lock and lock in struct most_video_dev
> are defined without a comment.
> 
> list_lock protects the pending_mbos list and the mute flag, which are
> accessed both from file operations and from the rx completion callback
> called by the MOST core. lock is assigned to vdev->lock and is used by
> the V4L2 core to serialize ioctls.
> 
> Add short comments describing what each lock protects.
> 
> Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
> ---
> v2:
>  - Add a commit message and Signed-off-by (Andy Shevchenko)
>  - Use the "staging: most: video:" subject prefix
>  - Make the comments shorter and accurate
>  - Drop the outreachy list (Julia Lawall)
> 
>  drivers/staging/most/video/video.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 3a0445ff6..8833ab5c7 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,6 +33,7 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> +	/* Protects @pending_mbos and @mute against the rx completion path */

Why is the rx path special?  I feel like if you really look at
this code you will see things that can be done better.  That's
what we really want from this kind of analysis.

regards,
dan carpenter

