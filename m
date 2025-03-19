Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C07213235
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421580; cv=none; b=NF6H81fTqm1fEKoxdV42LXcgD485la9GBb5NJL1Ucb64svtYBRkDr7x5pbFRx2FhHDrguBtWshvgACxO+90Cu74aU8yreY5U3GQgAVpUL2r0EmwWkENQ3iRgyhgKNekKoCrq5mVcN4asw6exoFlSgf+L2WTsnPYRHjQfcj3F61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421580; c=relaxed/simple;
	bh=RKb+1sIHBOGYefHzaK1Sib+IBGYlcCV1odTLTle3f3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlAgfsEE0j73m/HgSxm61DkxEnjEC/W/FxiFFqujdDs9rolraqypUAANGS/c1UsV0Ks744MT7BbKFrhoS7XitHxIsi3PVFhx6RD5lkYdsSrcGOBr1LFgx7n041ZND5R769n+Mnx4hCrZRKtpvYXT4Uc+yE+Tl0rYNGdPUISd+0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=RtIMtlOe; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="RtIMtlOe"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so314590a91.2
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742421578; x=1743026378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFQ/YvYbZ8R0CaqRMB9MAnlKHCmO+BcDVa05l7CnOdE=;
        b=RtIMtlOe79wHHlx2ncMjn1Gg4GwFQt2pmYCwpG1gkvdpqADijI65fb9Q0IR71PqQ35
         hRIUA9+T1e1BRqqyWF7TIwHWbMOcEgOl4TVRsVWbHdWmeTZ0JtS/zH5I4nwXUrpXBXAV
         PheJO9KFx0AKQbCHbVhyPMjtOiyzFJVcLDhi0lFetbytUCpQ1TqLLNtRexmuTyjSfMxX
         YkWFN5ny62A/sFW93lWySodk2jtwyksoPCu3xwL195d/qQon73AlIcbhRqnKFrjF2yVs
         VWwYY3zYcsM8T0TdWDNPss2L5cR7KSILjqkASiTwj/+D5Z2/nrI4arPnT1vXTrHdBQ5K
         L3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421578; x=1743026378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFQ/YvYbZ8R0CaqRMB9MAnlKHCmO+BcDVa05l7CnOdE=;
        b=NRVgdzaP5CwBIer2wLgzremhUQBrnapHOV0GLq8efoM4uU3HZSDWxf+QZozggQPh/4
         JzP5WAdhfV+xawyfc7gfKa99vRnd7EWW/szPFTIkftZGrUZLQl3jzgIrBQaAhGIvv3Oe
         u5VmLudYaSS5Jp88W3pO3Go9vgqWhp00fsFWriDHGxW5EI3KLs/06RSNyNfgn2DUApXx
         GSzwNjukxjPq1sGGoIeORV10HGunpQitwwHOFPfHtY45fC6ZL/8N9xGe7fzLd27tIuuf
         VNVW4Ok0RUg4Co+97R191nuISxJajxH27414e+j7ldt9jvBNGfgZbfMWNuAWfgFIYfA+
         I6qQ==
X-Gm-Message-State: AOJu0YwCBA/fuS8+VStUIqMnhRq8m4yusg7K+E/RsgBRjsUPzWjOxE7F
	cNg6pM4fKCaW6pgMGgiHEOGdclSv+f5LR4Mjkkq4rDBJ10zaYV9/TCNB4PEdcQ==
X-Gm-Gg: ASbGncvaUHqi6GrGMkdZUNaSZdYfX+rGHh8bqubBFEOez753+lNY1vXEIERIPfcnYx/
	UdvAIt1CBnn0HXB7lRPMcYGFePJe+j0AzRewK2S7cSSpRXRgkTfLg+Dci1Y0r03vvIlDO9hyRW0
	ypZF074djouxOc4hs6N+FGiod1MIj+n5nZT/5KP8NX9iiGpnHJWFQVpbH7rV+tVHPkxruUsIdqA
	hJDhMg0BMk9h80kSL6XIOdTWZ98/Ns6Z5mDG6hwlzZqw/LpqUTNhSezGx899poNYB89AX6ZCfHg
	vQN71B32ApryHMc1hR9z+W1y/rFrWT2uY2FTUsc0uvaZM7r/WZB3bdXh6F6bD+aCVhzR+dag/Un
	Pq0k2BszUTw==
X-Google-Smtp-Source: AGHT+IF60U1DlELYjOK158XzDQ0+T3RR0ImRj2326/SIg63h43OsS6AtFzreZLXkisKErOKfa8tzXg==
X-Received: by 2002:a17:90b:390c:b0:2ee:9d49:3ae6 with SMTP id 98e67ed59e1d1-301bde62d9amr7148937a91.10.1742421578198;
        Wed, 19 Mar 2025 14:59:38 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5cfd9dsm2220991a91.44.2025.03.19.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:59:37 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 01/20] staging: gpib: struct typing for gpib_board
Date: Wed, 19 Mar 2025 21:59:05 +0000
Message-ID: <20250319215924.19387-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319215924.19387-1-matchstick@neverthere.org>
References: <20250319215924.19387-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for gpib_board struct in .h to allow drivers to migrate.

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index b41781a55a60..7dc5a16e427b 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -23,7 +23,7 @@
 #include <linux/interrupt.h>
 
 typedef struct gpib_interface_struct gpib_interface_t;
-typedef struct gpib_board_struct gpib_board_t;
+typedef struct gpib_board gpib_board_t;
 
 /* config parameters that are only used by driver attach functions */
 typedef struct {
@@ -220,7 +220,7 @@ typedef struct gpib_interface_list_struct {
  * It provides storage for variables local to each board, and interface
  * functions for performing operations on the board
  */
-struct gpib_board_struct {
+struct gpib_board {
 	/* functions used by this board */
 	gpib_interface_t *interface;
 	/* Pointer to module whose use count we should increment when
-- 
2.43.0

