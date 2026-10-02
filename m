Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA94F47CA8F
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932696; cv=none; b=sMXdfdKev0C+eTHh3ZlG28bAcOuq8AkBdm4QNDOqE0FMJwXRG8Z8PUnB9vCABqU5lbdL3Qlo2Mhp3jU9Iq0us5Gs/blc5+oVk4vWUs1Qz1HD34sKnZ++SU/FqzU4alALJ+qWhk1om/zpp8Xv0IaAtxsjorqR83PiZJdtlPMH5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932696; c=relaxed/simple;
	bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oD5LWeh46lgLbKMmw25M58mMiFyU3FKaOGgJow52m5iQ2mm9umkpmFPqZeo86SzDtbTphI9P+VEBAJSLHoFMJNIZertXxePJ9C/W5iruPnelpj1GciQ5d0k0auOF31nIrdPQU4zeZGdnXJ98Q32GcVM5te2P2j2+1IOdL8skmeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAwAVkJF; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAwAVkJF"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1652890f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932693; x=1791537493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
        b=FAwAVkJF+p6Lidm4DxhgucdDOqB4vDHCHnRF55cXDlN/i3TF9V8bVcLW8L4GO429Sv
         aNjAVCfqp8mNS7TE2S2S5/B4n6CUvruzKfkFRbPImoLsIfPLM5Rw7f7l7JR8UkdENLMo
         fSisyMT382S3phDJFxh70F/w+xb5Q13nKjYNqhHYRUp/91C6HgL+PtVfWTbSJF8Lp+yu
         aRMtYVtc0D+Q0NcRiRky+DyPtdgtFClhpPeWDftQ3tDZQ/eKxAaEj96Bbg5DVVRE6bv+
         LCflelSpiLo8tWeDBMWmXEDEKQkLwJcFwet14g7NxIFKqlCctT8VZHlrN3bqy9jqBDBS
         sm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932693; x=1791537493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
        b=GapCFQAxVKrm+H6CAYb/p5iMIVinnC63TvJ8+kwk9yEs6qxE8U+47LkKaWp+mqESeT
         P28osHo6LCtLbr7Z0Y3JKeGqTQ/6R222rlmlOivts1f9dz6W28sV5bc2K/6IZwUGP1L5
         y4o+eIgQOXmDLa+kFNSNuPFKiVJhv1b1eMV2auAQPbAn/XqmYuYjv2rJxqdVw61QVx/2
         4MB/Dq6NMdC5BSF1cS4YAetYN0l/zV17SI7rb4833/iN6RWEWJC2nTpNvclmNplYSw6W
         Ws8IFb22BRvwMkz86iX8ZY4vWLIakMRFbwIXIuPepRzt7Dl4ZyIT/3AzYT2oS9v0/h9l
         Gfug==
X-Forwarded-Encrypted: i=1; AKwUvBx60zaSocIER/l/T67jsffSBTg/YYxjCyxuF3/0DzWV5zX2kDG0+RN6zM4ALYYpEQNJFBMKQ3qO5t7RX0+r@lists.linux.dev
X-Gm-Message-State: AFq9FYJxU9T/9X30ME4JcAN0I33LthkjwPU04R9aHySA0yvp+V24oBmj
	ku6UIr1Y65SSpGIP0UnVp/yMx7zzW8bW7UDTsP9RnAUZMR3s47LZXXhQaarimRur
X-Gm-Gg: AYBFou0GmND9foyXGg/THO0VwGhdnmqm4r/HDwjvSmfQ9xvF1Ajvl7UZfRHAWsER8Mo
	4LpqcSvPeaAAwxRwEblQpj7usLOuhIvbX8/a4CQsSbVidpz7MbiqRGIjr7+GB3uaNL/q+0WeeVk
	7QoaI9mQqz2ZHbCBlAyNWtnf39Qo5thkFxaxIgSHIc6edxThX+8RG5E9l+qE/EakS+50aO36TKU
	SzOVGM/up4/7/+hcsc+zZLXq09ljtKT4IfC9PBhKnHCNXPSJzJQEO5ZEXCUEliZuouoE+bglwRb
	Lw6kt6v43z2ha8Q5HJ0mH1FSqBuQIbTkD+kfSPL+xnNOE+RukZtb0/P+0Q/zwCl03K8sKDmpx4Y
	5vQkAA7dNsNiPxSJmlbArrWAW92opAeloqbwKG/kdcu2OZ5ji4PGE9MjcPRnloztMyViN+W4Vn4
	PDxA7BB9cbJ0yxdferko4AJnt8xcUmkIQDoR5dxoFrt4UKYWa+8Un3910aJIZyeHyWRYaC2MJ9b
	6Tpl4wg2ii5LeUFdgifDc5GV15er0+GeP1zrJaw/DsxnRjBYBYxWfG4R+M=
X-Received: by 2002:a05:6000:4112:b0:48a:f02e:1d23 with SMTP id ffacd0b85a97d-48b12741316mr3374960f8f.23.1790932692892;
        Fri, 02 Oct 2026 02:18:12 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f98ffsm4465019f8f.38.2026.10.02.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:12 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Fri,  2 Oct 2026 11:18:10 +0200
Message-ID: <20261002-media-v7-p09-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar68mkS8_qRdGJQr@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com> <ar68mkS8_qRdGJQr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes. I changed this in v10 patch 9 to use the existing IPU PCI-device
matching mechanism.

The patch adds an IPU_SENSOR_CONFIG_MATCH_FL() OVTI2740 entry for AtomISP
PCI ID 0x22b8 with a 288 MHz link frequency, before the generic OVTI2740
360 MHz fallback. The separate per-sensor override and its hand-off patch
were removed.

With Best Regards,
Maurizio Casciano
