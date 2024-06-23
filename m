Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25871850A0
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165465; cv=none; b=AS5BAhIYTmMPxH4kwyrkwSWdTL/UNO+tawu0H8Dyptt703zkuSvLKnAJ+My7t3WrrBL+yRXMTz1hzEkAdslLFW1zmoJZnMQXy27vq5fSwJva3nSLrI3rzAFq7oVDxiCKsTaqpCHZI4lTs4QtCJcOmlLi2Hrl4uMCYBwfqZYNds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165465; c=relaxed/simple;
	bh=vA0bWNYIrquhBSWHBJDOxyLqstyb/6YeHv6to/EnNWc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rebgzHvOqd14Ow1Ufh672pQDeBlJbaXufQgpifWG/Mzbi6BNJAL35U/xOI2Z5Ec9diOJ0QewC+X5bfX02DMsLeEGiNAwQ2UmJcRAQdXNQAGvo+JTKxhTntsXLFK5Fdwnse0bJYDcO7mSUjM1CVwvVUaCEgo/qj2HJt1782H8ngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beIj+R5Q; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beIj+R5Q"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4247adb75a1so4464345e9.3
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165461; x=1719770261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzYJslVL4+EQwJPzZpfQIy+dCA6PC/XlLcrxh7veTJU=;
        b=beIj+R5QynZrCjTLwiKT3WvcM71kUMl8rqnGqT+ExCgRRPOA5kwTpTB0epK1vX6+X/
         KTbXVCdOuYnD5/3yeJEg1f16O09Dgz18pQSDvbQIErriEBMxPBx59DoZiai1UeiG373u
         bcz0rSLudBgxzA2y1CqbCkARccbQgE6pQbdasCUEcEgmsfbcegQ89EWDtpIgJ05iK1w2
         ZWNfElHUAE18I9C/wdxhv/BBFIRmHmFDlRSnQgMJE4PxaSxaZmAoCNUDcjcjaKCZC9KZ
         xArgFg+JeQhip1aZgMLwGU0YH8s8/TTLSmkhZn7gxVqTkckzrAicWN0wwNqsj17c6IlF
         8eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165461; x=1719770261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzYJslVL4+EQwJPzZpfQIy+dCA6PC/XlLcrxh7veTJU=;
        b=RKg9AA478geHsOYXNEfGm4UQQo7X1LECNVSfEJk9JHdnEW3YwPm+FtLY32xtSyCmSN
         eTrfFfGuwwmPN5i14we5BpLsbEyM9D2xJ7CWUruSPn4ZoP+wx7pZZo4Pwaz2zI9XlzIW
         Z/AJikh1oOB/zqNmTmnkc+46VAJH+h5E+seQKcIe+HRXa0shyRmjFiXXyPWKTfO8F9PV
         SPE7LwpbawGbEbNWjiupCz7tPmk4I0IR9cEdgH769HjR5vA8/kZvKFVtCFLCTa8J1W31
         Ny9D/5zLbFgFyHCtMvS+QLEH2OmQmad2gYmi1a0wos7TSgL9IroDbOQRq6X2o+7E7Gk8
         K1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUWZjCa7ThkfEWJEb96xxIhaj3Nr1a7bQhoB3OH0MoOVt1OA/0zw1NLu/Garf4z34WljQ9QwVLBDadLZJgMdnAM35tDcdDStrqnkOZuCQ==
X-Gm-Message-State: AOJu0YxID3MvX/2bEPdn4HfYGAVRnBzyvzUewt/gk9nAJJiL+Ms4JAI+
	Ui6rtkXILviA+8BitZvLabetBciOeimwaqFzA6xZVjxJYDsZt+OEcX8j7A==
X-Google-Smtp-Source: AGHT+IHYxGgEn2/HHiaL9a+L/jhCM4tGEr//7l/Je0sbqdub0y3j1iVnsY2bicPRoxDhQ+shZ70I4A==
X-Received: by 2002:a05:6000:1f85:b0:365:da7f:6c13 with SMTP id ffacd0b85a97d-366e2a099f0mr3087367f8f.2.1719165461023;
        Sun, 23 Jun 2024 10:57:41 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a71ddbd3479sm172316366b.189.2024.06.23.10.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:57:40 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:57:39 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/14] staging: rtl8723bs: Remove unused macros in rtw_xmit.h
Message-ID: <3d0c5e727098f7eb3ceb5d3ebe0562515dd19bcd.1719155208.git.philipp.g.hortmann@gmail.com>
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
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 676ead0372fa..a3b4310caddf 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -35,7 +35,6 @@
 #define BCN_QUEUE_INX		4
 #define MGT_QUEUE_INX		5
 #define HIGH_QUEUE_INX		6
-#define TXCMD_QUEUE_INX	7
 
 #define HW_QUEUE_ENTRY	8
 
@@ -192,16 +191,7 @@ struct pkt_attrib {
 
 #define NULL_FRAMETAG		(0x0)
 #define DATA_FRAMETAG		0x01
-#define L2_FRAMETAG		0x02
 #define MGNT_FRAMETAG		0x03
-#define AMSDU_FRAMETAG	0x04
-
-#define EII_FRAMETAG		0x05
-#define IEEE8023_FRAMETAG  0x06
-
-#define MP_FRAMETAG		0x07
-
-#define TXAGG_FRAMETAG	0x08
 
 enum {
 	XMITBUF_DATA = 0,
-- 
2.45.2

