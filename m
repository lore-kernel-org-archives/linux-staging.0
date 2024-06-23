Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE5F186E5C
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165499; cv=none; b=eZcpDdLnAWORgfMxaUAAWe1O8NUaAaZvZKGdNKzi4b4NDC8XrkZD6TOPt3zjZOJysKYvi6fux0b5y3E66OG1xnOxLB4rdCfA0rsRln6XiwBL1ebcc6vvwXETWkkoOvSZX2lsyV8BVCGVk+Dr6J5ef71h9dq9zxTjxtsqFpSSLfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165499; c=relaxed/simple;
	bh=qyGIc+oIfQgy5MKT2F+qVfi3DUjrNkAKWv5yBxbxNEY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQSyUnAKSDbSPqT9XVZfOlT/oyWax7JHLpT11I+e396FOGa0lRpMU2kzFI+hGmmnlxN+fRTeWEYC4oPu+pS2k308pZxmCpZb51DcSZ/Dfwo8hN5ek4RKyeKMSEXLvI7ljOPJdj1RUMtjYwVPh0FdZFzzw1BfkVp8zu6rcTcfv20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha3JOdDV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha3JOdDV"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57cc310bca3so493314a12.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165497; x=1719770297; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0AO01oKOA3xCjs8tyAcfStxUCftobcQ/yCAcPc0dY2I=;
        b=ha3JOdDVDdxIZpBNBRKntTVJdV75Lg72xJJx0wjnkU10kRFvBzesle4k4CF2Bg7R7b
         elTnlLr4IonizM7P/Sdjd19djILPrXhotLaz6CMG40rbgk+XUVKxuFcZWGhosWlwhGdM
         m5ws6EdQB2pzEYe0euxGoZRrmLK9h6E71E4mbuCDTAvGDqMhkrGCo0Y68a+74LDFLeIL
         d43Wpj7HWTwH0KDdqY8923YGInNB0Kf52EF2o+zSJnMB6m2glIGDKYVj6WAHl+YpasiO
         b1zMVNEn1HX4oZPb4WHyTHUld4xE2Oh/UEyBV8O1RF+0LVqoKs7U9Q5gDQGm0v7zmmy/
         5TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165497; x=1719770297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AO01oKOA3xCjs8tyAcfStxUCftobcQ/yCAcPc0dY2I=;
        b=w14/tRbuJyNMNsSoqSEwMrMaADXSuM7Q3hRd9x8btg5CZXlks+2V1JLk0CxdumZgoD
         CmuO8FEOVSNM+4VZ4CvKQ/3zmPq/4UmeQK3yBTrSYPmzt2vL/9vjKvk2Balo+TznO13G
         mP63teGsQNk5DFjymOZlXge3Pz0VbZByeeGmpMdLSWTU4o41f+uF+2/pEbDALhC7E8hO
         nPoIHGXmgKL23YbbQeEiw0xF0XrI6vIUWYsVLlaVNYdZx6OK/g8RbVuiSxLZDtL5IIQN
         7DXkIoPYPi8hzVPTFoCHwAP+XrYJVWTCaP/On3+zq1U/gt0xFFdAAaRljDG5x60hJ4L/
         tFcg==
X-Forwarded-Encrypted: i=1; AJvYcCWGnJFzF0eoduQj3B12Ll7kL9yKnsKE1BL64xt34M1rRMJbm1rHOmZEdzofqWgkidxFV5e7o3UeREGhMzRjEUV8Svayd3fIDGSr9cyqtQ==
X-Gm-Message-State: AOJu0Yyt1C2DRN6EobOUi3tH8DGAMKbtJwLmlV1VscQzemwC2nFZWvCu
	ropgbY9sk5YajFoXgzRQYX9pfDtk4ywbIei65DYx0kbZkbn2LcC7
X-Google-Smtp-Source: AGHT+IFvvdMNsYHLTJeHDtdF6kgpyqtgEbCpVNVhVf/84J4lSYrjGv64FjYJ8nQzXE5Nhx9x1e2prA==
X-Received: by 2002:a50:d61d:0:b0:57c:6d24:26e8 with SMTP id 4fb4d7f45d1cf-57d43b68d3dmr2167140a12.4.1719165496696;
        Sun, 23 Jun 2024 10:58:16 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3041208esm3743177a12.30.2024.06.23.10.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:58:16 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:58:15 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] staging: rtl8723bs: Remove unused macros in rtw_io.h
Message-ID: <91e79b32292ba567c2ec624e130350a40a7866b5.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_io.h | 57 ----------------------
 1 file changed, 57 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index e98083a07a66..be9741a056e5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -8,70 +8,13 @@
 #ifndef _RTW_IO_H_
 #define _RTW_IO_H_
 
-#define NUM_IOREQ		8
-
-#define MAX_PROT_SZ	(64-16)
-
-#define _IOREADY			0
-#define _IO_WAIT_COMPLETE   1
-#define _IO_WAIT_RSP        2
-
-/*  IO COMMAND TYPE */
-#define _IOSZ_MASK_		(0x7F)
-#define _IO_WRITE_		BIT(7)
-#define _IO_FIXED_		BIT(8)
-#define _IO_BURST_		BIT(9)
-#define _IO_BYTE_		BIT(10)
-#define _IO_HW_			BIT(11)
-#define _IO_WORD_		BIT(12)
-#define _IO_SYNC_		BIT(13)
-#define _IO_CMDMASK_	(0x1F80)
-
-
 /*
 	For prompt mode accessing, caller shall free io_req
 	Otherwise, io_handler will free io_req
 */
 
-
-
-/*  IO STATUS TYPE */
-#define _IO_ERR_		BIT(2)
-#define _IO_SUCCESS_	BIT(1)
-#define _IO_DONE_		BIT(0)
-
-
-#define IO_RD32			(_IO_SYNC_ | _IO_WORD_)
-#define IO_RD16			(_IO_SYNC_ | _IO_HW_)
-#define IO_RD8			(_IO_SYNC_ | _IO_BYTE_)
-
-#define IO_RD32_ASYNC	(_IO_WORD_)
-#define IO_RD16_ASYNC	(_IO_HW_)
-#define IO_RD8_ASYNC	(_IO_BYTE_)
-
-#define IO_WR32			(_IO_WRITE_ | _IO_SYNC_ | _IO_WORD_)
-#define IO_WR16			(_IO_WRITE_ | _IO_SYNC_ | _IO_HW_)
-#define IO_WR8			(_IO_WRITE_ | _IO_SYNC_ | _IO_BYTE_)
-
-#define IO_WR32_ASYNC	(_IO_WRITE_ | _IO_WORD_)
-#define IO_WR16_ASYNC	(_IO_WRITE_ | _IO_HW_)
-#define IO_WR8_ASYNC	(_IO_WRITE_ | _IO_BYTE_)
-
-/*
-
-	Only Sync. burst accessing is provided.
-
-*/
-
-#define IO_WR_BURST(x)		(_IO_WRITE_ | _IO_SYNC_ | _IO_BURST_ | ((x) & _IOSZ_MASK_))
-#define IO_RD_BURST(x)		(_IO_SYNC_ | _IO_BURST_ | ((x) & _IOSZ_MASK_))
-
-
-
 /* below is for the intf_option bit defition... */
 
-#define _INTF_ASYNC_	BIT(0)	/* support async io */
-
 struct intf_priv;
 struct intf_hdl;
 struct io_queue;
-- 
2.45.2

