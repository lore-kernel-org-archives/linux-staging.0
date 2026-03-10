Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC912DA76C
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107126; cv=none; b=GPkupT3E38zuGXGC5wQJxejzfzo6HLYK+EOv1h0VP4xUYmXd/NHiNBGQxjljyq676Wl/1YQ1/7LMx6WPFUCfuKS4K+PZd5yrP9K1KNxdFTZ8imCN4R2h4FTLyEl61ynrp9WLLdNIge9dftqeM2EtG8jGc2beQB4vhaoQIsNVbZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107126; c=relaxed/simple;
	bh=NWnb1fz0OOY2whuYztDTWpcp6fE8wheX2AuIrQXXCKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXXe449HuvaNa6KWMK+PYRveg4UzHLAcxsewHNg5QbfhVxVMsmPx8rXHI48DKex4Q6E4x+zavbcFRIOI1vbnU/vrKyq4nVypLdwYvax8YPpAKWSwpwWAQI4Dk+F7IJbpaHcqg9jic10n93cKJisRqa+lmf2D9QM3/3MhwKYPw3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICyjspD6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICyjspD6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35995cb33a8so4799656a91.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 18:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773107124; x=1773711924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BN2bKgKnvqYn+3huNQ9LipEF9GCsrUOf9QWzhQKt2eY=;
        b=ICyjspD6dWaKNMmImrsa3SA1xWkQQhhKyp5iM7VRCVdH04Z9QmWOF7tVdrMHnlpWNr
         Rxull6j10TJ56nYtlItEiO3kweoCNRUffNkcnZkzzbR7IjAvxDyUwTVipmRbwIxh4F7E
         1BT5t9EdcKCCg/BQUTxid5HuWGEHQ4G/3jD4SLZYDXQIeU0qkbVAvXNmQxAU9ge1zuVN
         ZWdmerBbbub549iT067+wsNtmf3J7UlkpFlurNr7kr36AsBVbO98/I2vh01TCLTbotBK
         Md92eyQAoq+Kw/vdKeC+AqsPBqF0vyRzZNdO1OQ/xzTu27jTpMSxaMwzUaQWjkq3MB1L
         2LKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773107124; x=1773711924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN2bKgKnvqYn+3huNQ9LipEF9GCsrUOf9QWzhQKt2eY=;
        b=rtWD5xM+qKFQN+bsNKQ9XSJ7vyR/dWIQbFPcazrADOBxTP66UZR9dSQUVLKdATV61I
         EFu9rdKLZ14YcA5gHpWWrTWENDAiU4lD45NSODTPzA/0s1NeZWoFDLTeUm2zHjzAaSFO
         8HCeyrAhL3iDSn2h/+Dp1+RfFaEEoIRhqNjXeGQdqFHO4eZiNkSTXHA4HugBtmwKYvae
         webTKO3co+FgaBJJkNusOWqFMPSlTgTbnV3oPzNvrjbP+yW322lZ1fegz+98rIsjIfgs
         pmz85UpJo8j0kXx+axE5Ux7siPr3qNo+pK1siefFqKA7Ai5hliE686dprxeXr1yBRZ+t
         nlKg==
X-Gm-Message-State: AOJu0YxqHj/tAuXXLmktUZBQqeYEjE/ONxFU/Jsn8YQbqmNS04xE+RgK
	AmGAHkFyDfsQcRnEKQDO4xUVyGqAQ7JR1DYvsijYuzEkQfbyGJkFK7Stvm/54rS5BP8=
X-Gm-Gg: ATEYQzyOWwXAXa/qs6rOiq+AxCQdnAJONQGQ6LMuC6JN26QMbeV3HMAInHSY6Z2Fobo
	Msg+x+Ifk0O/0LMf9M6Dxh1kFhf4gqM1y0MuHOuSTmKmEeE5/rUYSNF5vVasrrTAP5IZszd8kAz
	atinBKHyXg/IvVh/UZa/zuW6h7kjek2OhGS7SLHdkNGCE/zht8+iq0a8szHmNMseFC1dgMv9+P9
	2/IRfAGh1rpwO20Bz0IAw59nt8zW9/AjAeG12OpUCRd0TfWnyyLcGMsKxJ1AitB+cSurpxmAiWU
	GbbbeefodfT3Q7EKw9DjyZV5/H25cag4Zi7YZeqn9hGZKy169Gs6hmBJr9WrwwTVEzFTxm5kFru
	pQ6X1c6iPyFml2dgTKb9s9n4A2W3rIbFfw3gkZZ4tZd20kPDgA3mXoJ98LaHmCKjSc2YaoNAo7E
	dJzwXY2U1+/u3uNAi0ygF6uCHU3+0qVXVqf/Y4iuLaH33bNWxivb15VdcLw9PAyJTUxlINrhWD2
	f0hZysW040fBfih
X-Received: by 2002:a17:90b:1e49:b0:359:f5f4:7740 with SMTP id 98e67ed59e1d1-359f5f479edmr153824a91.17.1773107123758;
        Mon, 09 Mar 2026 18:45:23 -0700 (PDT)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f088e4bbsm1031269a91.9.2026.03.09.18.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:45:23 -0700 (PDT)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: octeon: remove BUG() call
Date: Mon,  9 Mar 2026 18:45:14 -0700
Message-ID: <20260310014514.40293-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An unreachable default case calls BUG(). Remove the entire default case,
as the three possible cases are already addressed.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index f5bbedac6a65..14d10659bce7 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -449,8 +449,6 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 	case QUEUE_CORE:
 		__skb_queue_tail(&priv->tx_free_list[qos], skb);
 		break;
-	default:
-		BUG();
 	}
 
 	while (skb_to_free > 0) {
-- 
2.53.0

