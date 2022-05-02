Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482DB2F32
	for <linux-staging@lists.linux.dev>; Mon,  2 May 2022 18:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651516254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2jB/3zr/hOAAqCnoexjZJZZ3VWJxDNXF2l2/CCgwTtU=;
	b=X8zRNr8Mr8H47ACj8LRXp5na3OH0TKUvD6lUCViZej0k2bchSAidMr38gWEeyZXV9Vxaz3
	coiWk+FkN7vSiBd7ZsjXuNVK1nyJhxhxv5x7IDFPeSlgiFWHe2Xb5XhDVBI1ju8NdmIbyL
	DXjBmYdTAb5Bz/IafNwFUy6AdBEsYV8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-Fi5zc30QMmK4qNcwdQpmfw-1; Mon, 02 May 2022 14:30:52 -0400
X-MC-Unique: Fi5zc30QMmK4qNcwdQpmfw-1
Received: by mail-qv1-f71.google.com with SMTP id 30-20020a0c80a1000000b00446218e1bcbso11619320qvb.23
        for <linux-staging@lists.linux.dev>; Mon, 02 May 2022 11:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2jB/3zr/hOAAqCnoexjZJZZ3VWJxDNXF2l2/CCgwTtU=;
        b=ZktKEk5ND6I9u/tAyy1s0lKquF/Ph0s0unhenjM8k4jAHYw8mcw5m3noACLHXhNbbO
         /KLSGUgTtB2/Xim0+WrKenjKMIUnAbp2BoahhNvkQL6e2FvesSsRezD9IhGrOQYcdqL7
         k+dkBIuY762i7w6zrEUSGjjHh2YiIhOK5ksjwnu5fNscgZmKIWjXpNvpWoCxSed+kuLo
         IAT0X69NlUFp8sQbn0nrNYnim5vw3P1ERC5QkO7JMCkVvc1Z65wUe2KUIfHSR7ycHQ8j
         Aa6tcgJn/O9OeZN/DgPolEK1GWJh2dRWUb3C5NN4lCCMmJoWQWagJWI1a2xhGBqCkt/r
         7wVA==
X-Gm-Message-State: AOAM531y+xo0R4aE7sK6Pbuhkwhcad52Mmd7IAv98vJEmVUf/6okClV4
	PqF0c7GNp22X2f4SVPMZdFPPdvKygxRn5tfpZFwzH+kMVtMpqYYoev41wByPb+xX+HJWenNP1np
	tWLJblo2x5cutRXJV8+5mEbvBpQ==
X-Received: by 2002:a05:620a:1902:b0:5f1:8f5d:b0f2 with SMTP id bj2-20020a05620a190200b005f18f5db0f2mr9595647qkb.60.1651516252182;
        Mon, 02 May 2022 11:30:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3CJBU92TjpturzqseBQ/Q0w/mIcCijpWAzznSsZQjXuIVQUluXrP1ZKrWbC/jmzJriC7Z4w==
X-Received: by 2002:a05:620a:1902:b0:5f1:8f5d:b0f2 with SMTP id bj2-20020a05620a190200b005f18f5db0f2mr9595627qkb.60.1651516251874;
        Mon, 02 May 2022 11:30:51 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h12-20020ac846cc000000b002f39b99f68esm4412204qto.40.2022.05.02.11.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 11:30:51 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: vchiq_arm: add reference to vchiq device in vchiq_state
Date: Mon,  2 May 2022 14:30:40 -0400
Message-Id: <20220502183045.206519-2-athierry@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502183045.206519-1-athierry@redhat.com>
References: <20220502183045.206519-1-athierry@redhat.com>
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

Add a reference to the vchiq device in the vchiq_state structure. This
allows the device structure to be passed around, which will be useful in
order to get rid of the global g_dev structure.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c    | 4 +++-
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h    | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 0596ac61e286..e6e0737c85fc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -519,7 +519,7 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
 	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
 
-	err = vchiq_init_state(state, vchiq_slot_zero);
+	err = vchiq_init_state(state, vchiq_slot_zero, dev);
 	if (err)
 		return err;
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 8f99272dbd6f..0d5c39d7c6e2 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2142,7 +2142,7 @@ vchiq_init_slots(void *mem_base, int mem_size)
 }
 
 int
-vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
+vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, struct device *dev)
 {
 	struct vchiq_shared_state *local;
 	struct vchiq_shared_state *remote;
@@ -2169,6 +2169,8 @@ vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero)
 
 	memset(state, 0, sizeof(struct vchiq_state));
 
+	state->dev = dev;
+
 	/*
 	 * initialize shared state pointers
 	 */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 82b7bd7b54b2..352017ff5309 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -315,6 +315,7 @@ struct vchiq_slot_zero {
 };
 
 struct vchiq_state {
+	struct device *dev;
 	int id;
 	int initialised;
 	enum vchiq_connstate conn_state;
@@ -458,7 +459,7 @@ extern struct vchiq_slot_zero *
 vchiq_init_slots(void *mem_base, int mem_size);
 
 extern int
-vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero);
+vchiq_init_state(struct vchiq_state *state, struct vchiq_slot_zero *slot_zero, struct device *dev);
 
 extern enum vchiq_status
 vchiq_connect_internal(struct vchiq_state *state, struct vchiq_instance *instance);
-- 
2.35.1

