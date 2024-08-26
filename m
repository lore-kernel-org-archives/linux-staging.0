Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06C54648
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 19:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724702362; cv=none; b=M7J6M6HWT5/NTKk+qG9FYReNrXfpiNj2JotLtj4K9AMJSfm0Cw+hz93QBtxte7kXoYw/1wMJej5AaW0EFYa4IA1dUXOjYqphqR0LZtDjdfYbIg7LiazDHkkBP/M7vBzF15qOJ0CSzrNNs+9bisf+4T+2mYXiGxIo2PJhGdONEQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724702362; c=relaxed/simple;
	bh=Bk+2LSaj9EeE+nnXluf87TBin/vqBAk22xmDYHO3fK0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uT3uaiG0kIsVysOZn94rmFxcmasrTvhEmpecbdhntzrD0Y3y2phllnZkGhKdM6XjAaAgaI9Ke29FskGuaTHax1T0a+Ew9hXl4MGiqSEXsZyWmwAe6wdkKtMUiGBJud9NtS5dXYxIitHfx+0EpIgFCtudZf8Ijc6l5jG6w8ZyvaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6GSfN0P; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6GSfN0P"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3bd8784d3so3694739a91.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 12:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724702359; x=1725307159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X76d0qzMljxYzwZvLsGN3K4fjbk21Yj71ASVecUJ26U=;
        b=Y6GSfN0Pda3tH1nTbXjPgBTzXXUnKG95ewU/ucaUKjybsHB9vbTEv5m38rdYgMyG1w
         aRy+cSykZ6M4vBZCoHUgYnmmhZD7owUSWdkQ9f7f53d1R7/r/8IA5eiEqd9a/JROGZHN
         d072Hb5929muejyzNSwQtGOIxPIiytc1k8dGWlw2qIfwVewCS3iaE0TvYRxApLyWEh92
         SRDo2OEc8ZZW3bgwovrOBqphg/Vs+NDyKr+TtDuOd9Hmgd9EKx/hDJ3T0E8d9oZOJfvv
         f52LdjfJq40NqbdzZJebS2VwzcFI0l8FaFToZ/rGIoFtTJG76nZziPUBNBRe+R3MHQp5
         BCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724702359; x=1725307159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X76d0qzMljxYzwZvLsGN3K4fjbk21Yj71ASVecUJ26U=;
        b=gX5+FbhS6/nAVSaoVfHEAK7UJ8L2FExGag+e/Q8wjrBmTFvd6FNsVUALmASNmUs5Yo
         64LeGtDFlEAYl0NaimyTC6a0Z0Y1vcQ8Kz5NIFoQcqR27DfPqY6YsVrZTXMMz+X+GVbd
         nAmxyqly72hdR4nrBayScyqZ9b183XUipY5XDH1rO0bkTtWFh30sj/TwAYTFIEtiC2aJ
         Ppt43oZXQDBtcXFUogAnmiPr4W2zMqTCtYinuOWpNJHQxZQmldOg9KZWikzlF/8KVMUZ
         BHy/akib3o9gLYeoprCip7QX6zn0m2Iz5tqHX05HizJ0hHUcWKQNYxDbxmIKyYNpHJ9k
         ok7w==
X-Gm-Message-State: AOJu0YyOIrI9na4DVBPE4COBhppnr291r/u8lcdv8CAXeHMlHavB1gxk
	DTQHkhYRqu30C2ZcnCS0u2pbWIi/vl/6w4SscfllmCs1Clhp0EvfMxF8/HjV
X-Google-Smtp-Source: AGHT+IGiX8ZhUr04nVshsnC3mMx1hoI1Wbn2TiDcAGgel7EEg9ph8TOx4wkM+IrviTWoui+RMe/YLA==
X-Received: by 2002:a17:90b:3001:b0:2cf:c2da:771d with SMTP id 98e67ed59e1d1-2d646c452ebmr12658738a91.25.1724702359537;
        Mon, 26 Aug 2024 12:59:19 -0700 (PDT)
Received: from localhost.localdomain ([2804:4b0:1408:4900:9408:c7b2:31:3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613919fd2sm10424308a91.13.2024.08.26.12.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 12:59:19 -0700 (PDT)
From: Gabriel Tassinari <gabrieldtassinari@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] staging: rtl8192e: Fix parenthesis alignment in rtl_core.c:325
Date: Mon, 26 Aug 2024 16:58:55 -0300
Message-ID: <20240826195915.8494-1-gabrieldtassinari@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix parenthesis alignment in _rtl92e_qos_handle_probe_response to
silence checkpatch warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gabriel Tassinari <gabrieldtassinari@gmail.com>
---
v2: Include the modified file in commit message
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ad21263e725f..18739583f579 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -322,7 +322,7 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
 
 	if (network->flags & NETWORK_HAS_QOS_MASK) {
 		if (active_network &&
-				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
+		   (network->flags & NETWORK_HAS_QOS_PARAMETERS))
 			network->qos_data.active = network->qos_data.supported;
 
 		if ((network->qos_data.active == 1) && (active_network == 1) &&
-- 
2.46.0

