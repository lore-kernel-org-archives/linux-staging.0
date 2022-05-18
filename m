Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B21FCE
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8gCe9susi6NfgsCNuuQgf+6siaGgjwLwt7ni61B8hg=;
	b=gsZF/JCHivndMJMKf7rp8ho5x2ybdd3Og9aWmOSggVGv8zQUIj+cOO6cMbW24RLwsjqsq6
	raMcMXdWmrROAgL0O9hyo1Sc/7UUbCHLdxPiU+nye9KnjH6wF3tz9NxBv+qQc4quH2WD0M
	iqcykIjySiksj6wLvw5eF4KA+wD9xDc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-PGfZv-efNeu5_QpR_w3ulw-1; Wed, 18 May 2022 15:12:16 -0400
X-MC-Unique: PGfZv-efNeu5_QpR_w3ulw-1
Received: by mail-qt1-f200.google.com with SMTP id u11-20020a05622a198b00b002f3be513f83so2390198qtc.4
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l8gCe9susi6NfgsCNuuQgf+6siaGgjwLwt7ni61B8hg=;
        b=oLqGM654IgcMhsw5eVMRBl4vwKpZvQbfo5sTAQrO6BfmgLcZXgzj0RFuA+DyElTNGD
         TZkAx+1b4xO/35e9tDJUW4yCCXd3E++up6QhVCfDCKhkDgOOAuuGLd4UmcGdiJqGWl7a
         8+hQuoe4Y1kPPZWpY40kunGgCHcjdKKLM1L+3mxC3gJ4dwR8upypUSfkgs7VObkbuevo
         73b0CS1uZs5xzKHTs4WIk3Eh7mftPqdQvg1EcEHW6bU708j03bc3M0cwctFCYT9Sk1Rj
         yoZLQBNcqM6ZpvtB/JZxw8jaRtpxAO42YJB2N4/f7ujQGGGKgJaOLqp5ZuVOUnPJP5Yv
         5Vqw==
X-Gm-Message-State: AOAM532x246aVOQUB72X4Ki6c4F2hPoFV4kpUK/Aqd+xwGBV0djNRFip
	l+PKyOOT7eQDa9NsIqTirEDW6cn01kFPXBdNM9nycdKqjhFG0gLODxTYofcBYnubLeBECItYvzQ
	GVlXpicFkZj+GhrjahJp6y+FpcQ==
X-Received: by 2002:a05:622a:1a11:b0:2f3:b198:ae7c with SMTP id f17-20020a05622a1a1100b002f3b198ae7cmr1198331qtb.100.1652901135465;
        Wed, 18 May 2022 12:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoiw+VUlsM0r4I7oEaqGRHv2kq3ELNWCsR/x3VttLIitkD8PwEu4ezBFl0oGDnWO1ud2vZCw==
X-Received: by 2002:a05:622a:1a11:b0:2f3:b198:ae7c with SMTP id f17-20020a05622a1a1100b002f3b198ae7cmr1198316qtb.100.1652901135279;
        Wed, 18 May 2022 12:12:15 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:12:15 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 9/9] staging: vchiq_arm: remove global 'vchiq_states' array
Date: Wed, 18 May 2022 15:11:20 -0400
Message-Id: <20220518191126.60396-10-athierry@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220518191126.60396-1-athierry@redhat.com>
References: <20220518191126.60396-1-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Remove global 'vchiq_states' array, which is not used anymore.

This is part of an effort to address TODO item "Get rid of all non
essential global structures and create a proper per device structure"

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c        | 8 --------
 .../vc04_services/interface/vchiq_arm/vchiq_core.h        | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index cd23d18f8b3c..7b9c100eb74d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -162,7 +162,6 @@ int vchiq_sync_log_level = VCHIQ_LOG_DEFAULT;
 DEFINE_SPINLOCK(bulk_waiter_spinlock);
 static DEFINE_SPINLOCK(quota_spinlock);
 
-struct vchiq_state *vchiq_states[VCHIQ_MAX_STATES];
 static unsigned int handle_seq;
 
 static const char *const srvstate_names[] = {
@@ -2157,11 +2156,6 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, s
 	char threadname[16];
 	int i, ret;
 
-	if (vchiq_states[0]) {
-		pr_err("%s: VCHIQ state already initialized\n", __func__);
-		return -EINVAL;
-	}
-
 	local = &slot_zero->slave;
 	remote = &slot_zero->master;
 
@@ -2282,8 +2276,6 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, s
 	wake_up_process(state->recycle_thread);
 	wake_up_process(state->sync_thread);
 
-	vchiq_states[0] = state;
-
 	/* Indicate readiness to the other side */
 	local->initialised = 1;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index f87b4b9b3596..e08206397076 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -450,8 +450,6 @@ extern int vchiq_core_log_level;
 extern int vchiq_core_msg_log_level;
 extern int vchiq_sync_log_level;
 
-extern struct vchiq_state *vchiq_states[VCHIQ_MAX_STATES];
-
 extern const char *
 get_conn_state_name(enum vchiq_connstate conn_state);
 
-- 
2.35.3

