Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663803264CC
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066703; cv=none; b=NinDhFfZGKZFhCeb0EbPepJvQz/v+EzjbfCWRHAFk/LKjr6xBKwtlmtNOLGjGcxnPvy3XhzQnVI52P3ZU24vRHsVXET3ubRJWf0N35cHyos6GaEbAAjlnbA2xjI9nkEu+IyWj81EikVY5xOooUpxc33jdbH8LeDajJrXIQGIa8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066703; c=relaxed/simple;
	bh=uZQRom0gOEmB6fHbiq8k/VrJlHLoufkcYR/1mJZyD0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3NVlY6Fex+1FSDf404J8Rf1P9Zd5f+j1/k7hl8cMEv9t4m/6bLB6irxRtxDcHF3ijiMLmlGlawL4vqWraqlAN2maeMqvdAB90BA5cbVPnqE3WY25v6+LujbLjbgCoK3wXhWs98MztKBVedMOCUsMeHVK5TTFXTLSzp+vOMWUZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXYZmaO2; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXYZmaO2"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f1f76ea84so1329530eec.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066701; x=1792671501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHThfDJt4B6WauVL/2Vr0/FHJJdXFFoLAtYeGFhagO4=;
        b=SXYZmaO20uZx5VL3QZbVKO2W/xtPn+j7SDM6qODf5O6hNvf0RBXXDYJ8HESBF059oP
         Pxw6mAc7Z2JkJ9t+IAl57HBxwlTUemKRLwTc25/SbkbyWoEGEH71vPBplEuEmY30n9hb
         bnTYKdHfzeCe7rgdx8OjSSf3BYvDPvPw83y27On5obm68ZEGecCmpaVyvEaooSksefln
         opC7ms9iKjIIJLvrEkQEmCGkc9h9hYXeNkg6LH6t06b08n0VqtsZhogutLUUTQoTl8Qd
         6pmRzypIvxgKXRk5KInqA7o86dEmR505mCVkDF2SE2xcfU09TqIBNlCBFbW5kIzn49fZ
         kY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066701; x=1792671501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHThfDJt4B6WauVL/2Vr0/FHJJdXFFoLAtYeGFhagO4=;
        b=P0ZV70Mxj2UVfk7vharfPmYd8Y+RrsQk/ZvJdQROcZSECHSRtiLtGLEy9T02/lZmEB
         ER8RAA/SDhrxov3nvr6CDNRIsPXt7OauymbJMynhpGostUTRxmI3KuZ93TlqRkgrgwQc
         g/ypmpQ6GK1yJZBayS4n+nLgeNk/NNUKTcjnXrnMRbTPuFvrQ9XqOziYZ97TjOzmgD6t
         yIZgD3CjxOFCF+vkrJxiKdmE+chVYd2j/0AjZvUMi5zEU7GYIH05vvAhMlmbaROjBZcz
         p+8jYae4EV46Gd8NUKFthZDUtZrEYvL3OR+Udups8MHse333Qykt8uVfNlawvs0+QF93
         5GvQ==
X-Gm-Message-State: AFq9FYIn+/NiY1JkHo8tiMsd2DKe+BGhHXrhGGFHEvfTzp0+hDspieXn
	ke2m2JfBQyNdOCgckV151acnfhQqLlTPjlFszDXuNg8ubitgdxfxfe0h
X-Gm-Gg: AYBFou1D/N3qebAEekRSCc9pwVyGz4nNOoRC2qty/TpL7lVc6wwTIsgJ8sZ6OCx1cfK
	TK7ElAqdF5wwLKT7PkskpACp0PWZKFic2PGqAv1XIQDmeMhKPm8wO7p5+JSwzyFeLhv3LTPQj7Y
	h1/uT1uf2OM2zlw7ciY0dYdSSDQIimfhD0S1I49BAm7dhRbGHaxZDnRb88DyorAA00HpwFFgQcB
	ZzqnH+5Mm7KVSd/WVIbHVHZE1U49F4/Ku1FqyWYSRtnQNl8iIjENsAuucU0KHe4q5BzVC3r3ahW
	PyKl2B3cdWGgT9d6WslqgEust4mlNuVzn6XIltKpw3onQLIlee1NHY9aZrYkt5ajPU7gQvvzoFI
	ZpuJjrBeIVoSIPFDif26Yl5lkIKAXo9WVR5H9XHlXdzkyfxEN7MIKmvblL7nnJfRxfCS36jQSMq
	iMFmnUFIBjsYC48lfE83goG2X/R1HvUGaklIFJorz7OQex3/0lbIoFTv5rDobxtcFhFBNVKgA/B
	A==
X-Received: by 2002:a05:7301:53c9:b0:359:d4c9:6081 with SMTP id 5a478bee46e88-359d4c96379mr17612443eec.12.1792066701355;
        Thu, 15 Oct 2026 05:18:21 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm61220790eec.30.2026.10.15.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:18:20 -0700 (PDT)
From: pdsj2807@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH v2] staging: gdm724x: make DEVICE_STRING array const
Date: Thu, 15 Oct 2026 17:48:06 +0530
Message-ID: <20261015121813.1130536-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015093128.1004956-1-pdsj2807@gmail.com>
References: <20261015093128.1004956-1-pdsj2807@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

The DEVICE_STRING array contains pointers to string literals and is
never modified.

Declare it as 'const char * const' to improve const correctness and
prevent accidental modification.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
v2:
- Drop unrelated formatting changes
- Keep only the DEVICE_STRING const-correctness change
---
 drivers/staging/gdm724x/gdm_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..65c53811f099 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -31,7 +31,7 @@ static struct gdm *gdm_table[TTY_MAX_COUNT][GDM_TTY_MINOR];
 static DEFINE_MUTEX(gdm_table_lock);
 
 static const char *DRIVER_STRING[TTY_MAX_COUNT] = {"GCTATC", "GCTDM"};
-static char *DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
+static const char * const DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
 
 static void gdm_port_destruct(struct tty_port *port)
 {
-- 
2.34.1

