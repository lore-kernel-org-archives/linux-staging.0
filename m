Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5663B1AB528
	for <linux-staging@lists.linux.dev>; Fri,  7 Feb 2025 21:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962519; cv=none; b=B/jSTNW6APVVpMs2J0cJcR8hnyhjc1j645ee2t6uJmT8hisL/nl8ZoUsrcQcf45ZybBrtvp5cFRdVGss+KiZkYJXKaOARYZ/x1wGL4SnmVTFIQ77kesR43WH26dOCG78zRI1NJoqk4vbHvM9jQ8Y27ZGACuC4wcFuw9BF/i3/2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962519; c=relaxed/simple;
	bh=Vfay3xfwl5ZL7vb7CBY/ipNeneNfsYNQSe4jRhVaRa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZcrIY7ir7B1SzrC6tAaeyhDPenglSMKziYypTxIfBMqWPkXnDU2gg7XenfFa71HBkpEMtzGAljkUtuuyG5XNsezLMVs/8mwVUkG+PKLzcJf2v1t7LSqQwL4ZdHo95u3DUVGbOH6+H5q28LefA5AktZw7adcNkXVcLziz+bqad8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8pvHdpX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8pvHdpX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-218c8ac69faso5644345ad.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Feb 2025 13:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738962517; x=1739567317; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DNwtoW5NAkLPNOoSFU7Fis59JOatiRfYCOIj5bFClDc=;
        b=T8pvHdpXWbNSz2xIITf4k1JN2dMQrsBSraGvtgJYsGS2L1rUQE4KUydetZ+xtMUHEG
         88BBRSZqiqNNql5c5vAxxQQXBvW/kCtYL1Q/Xb+JozU4Sv5wBK2Hngnx+Y+XjCd882aw
         i68yTVKmcYS52e/YE4/DUSPpzyThXQ5paMAPMoNKapZgoHpwqOx5Hk1konm3+ZC/AiFs
         9CexxsYSraBWno7h7MUcTDxiuwT/dbBJYaArqdA06o+nBUd5YFERYBBQlGRKxshkGQdU
         qxeUQPl2VbpMq1GdRhCfgtO4uzJHANktndgYzFQ+g7WkunwLDyYtr2Wacc0SsbawEbic
         mHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738962517; x=1739567317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNwtoW5NAkLPNOoSFU7Fis59JOatiRfYCOIj5bFClDc=;
        b=ApxT6ljTLSnmEpZ39sxg6WQAcK7KBih7GewTvhNKyt8rQF/p0WhJ3U5DRhk6FqwuTo
         80D/vLGagzSVCrF0VhvYOZJMDUOoGvVYir/1nDPmWkTW5acQIgv3kZ7mpqMGRDhmZoKq
         mILqc23+wPBX+FQaRGQs8bz6KlAKuQsj3pLYSjC6kDuaKoQH6vNk6ujKRlmlK/fk6Dje
         kACG9dcIVcnGHGwL2P3qPhSRK2JzqEWLvzy0az8tlGwkt5crZtJ/tXSAI/GbQPkeFSEe
         mcAz9MAvS4kkLvkqW5Egh6ZZ0965MQmv/AVlxVhBi3fh/9x6Ch/XxcJYAU8cHMz/aIpf
         bIrw==
X-Gm-Message-State: AOJu0YxQ7438E55QoCKfsFYx03dIwCy2PuCrUcvnN1dAlWvldh1Ve6LB
	WY9q+hwrk833U6VWIT1hwWP207AQ37qHQ9Ol8YX7Ea/IIYjyvIj7
X-Gm-Gg: ASbGncu6H6Oh6/6/fpcN9Q2UA7GGzLA3Skvu+oXaKGCI7O69Wy9ej/fHGaAnvJp5Drk
	HT/WNj4AKbCvSA2IW3ksNnw201XdhZH2qAq2GpPxfH9j+mVb5RLwQIeFixpqZm50CiI/fZXAdGf
	QvzeQx3ah4zK0iOA6Q55JS5aQH7o15jxzwfcQqqAz8IJYmZribKabrJxHt39/lXxzLlG2Nx1rm7
	fqje11ay41p80/LS0WbU81zTgjLoK/u0yTMBvUd19SNK8pFMDaOkVqbE8yy69L+LJI2zphIcm1C
	JOdk79pwRXkrpFb04un+3O3WlmEJ1BP3xkuOWWBAVHJPAQ==
X-Google-Smtp-Source: AGHT+IGY69ccVENQ9aVm67cFOHoewSil0EpIe4Hb+Xap4piHWnmLeaSUd+548Z41LXsXUEPd9624dw==
X-Received: by 2002:a17:903:2381:b0:21b:d105:26a7 with SMTP id d9443c01a7336-21f4e70e4f2mr27557855ad.6.1738962517525;
        Fri, 07 Feb 2025 13:08:37 -0800 (PST)
Received: from debian-BULLSEYE-live-builder-AMD64 ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b02dsm35044015ad.74.2025.02.07.13.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:08:36 -0800 (PST)
Date: Fri, 7 Feb 2025 18:07:56 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: linux-staging@lists.linux.dev, dpenkler@gmail.com, 
	gregkh@linuxfoundation.org, arnd@arndb.de, dan.carpenter@oracle.com, ajithpv.linux@gmail.com, 
	roheetchavan@gmail.com, niharchaithanya@gmail.com, eleanor15x@gmail.com, 
	everestkc@everestkc.com.np, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] staging: gpib: ni_usb: remove unused variable
Message-ID: <tkq6c4e33nhct6lsxjqm4iwanefplvyvhqain3ofnctpbvx26p@royoj2icj4h7>
References: <20250207150427.153982-1-gascoar@gmail.com>
 <20250207150427.153982-7-gascoar@gmail.com>
 <2a172c30-3df6-4f5b-a63a-04d279738b64@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a172c30-3df6-4f5b-a63a-04d279738b64@ijzerbout.nl>

Hi Kees,

Thank you for the review.

On Fri, Feb 07, 2025 at 08:46:53PM +0100, Kees Bakker wrote:
> Op 07-02-2025 om 16:04 schreef Gaston Gonzalez:
> > Remove unused variable 'adr1_bits' in function 'parse_board_ibrd_readback'
> > 
> > This change removes the following warning:
> > 
> > warning: variable ‘adr1_bits’ set but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> > ---
> >   drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > index d0656dc520f5..b7f221def217 100644
> > --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
> > @@ -427,7 +427,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
> >   	int i = 0;
> >   	int j = 0;
> >   	int k;
> > -	unsigned int adr1_bits;
> >   	int num_data_blocks = 0;
> >   	struct ni_usb_status_block register_write_status;
> >   	int unexpected = 0;
> > @@ -460,7 +459,6 @@ static int parse_board_ibrd_readback(const u8 *raw_data, struct ni_usb_status_bl
> >   		pr_err("%s: bug: status->id=%i, != ibrd_status_id\n", __func__, status->id);
> >   		return -EIO;
> >   	}
> > -	adr1_bits = raw_data[i++];
> Careful. You're removing the i++ as well.

Ok, you are right. I missed that.. I'll redo the patch.

> >   	if (num_data_blocks) {
> >   		*actual_bytes_read = (num_data_blocks - 1) * data_block_length + raw_data[i++];
> >   	} else {
> 

regards,

Gaston
