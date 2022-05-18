Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A41FD4
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3iPx7qaaPixjw/oS8UgHujPw/Xc8SlGxp3qIEtkoeE=;
	b=KedH6kwOeLxTEJPtoLrLWF56ht6YVJkQ+JdWdm8MIH31D5BXnkh2TqJ0hts3k2pXwCTw+O
	NVxFswTPn1o8faM/yttaXAw8eZLy3Xdj6A5J8QWhoDPRR++eZ/nQDs15BbgysTSJZr67Jm
	TbqSiBDAPOwxYiebSQpJqbj5syPBZy8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-zCCq9qIANUq7CcxiBVWGJA-1; Wed, 18 May 2022 15:12:08 -0400
X-MC-Unique: zCCq9qIANUq7CcxiBVWGJA-1
Received: by mail-qt1-f197.google.com with SMTP id a28-20020ac8435c000000b002f3bc1cbd08so2345036qtn.18
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z3iPx7qaaPixjw/oS8UgHujPw/Xc8SlGxp3qIEtkoeE=;
        b=ob5wsJOvZnyFe7E8y8v8OSbXCcp+Okwz86gabn0pCdRjMtbdzFGy4jFA43VcqYJtM0
         OrUm4Tg3rJr2e3HfUo9odlK/OIttg5QGF8yvGEL77K/sfG5VngJ9mSfsn+3O+LwfC2li
         QsWiUCHFIwLcIVgqZbvc8IEzF02k3xevGeLMz3mUAD1u8lXKgQWOdB0w4F7lT32TCpGr
         i3WEFv+u1CjiFG1+gFin+bzQC0GFMWsDvFVtnLONcvcPe0iP8rRWgRVjOkf0H29TmOu7
         Ch6KW3oNUs+zs2ng4bi2Y5kELhNeevHnAm4NCOxcyg4rOaGsYQxwy16a4zfPZ23uXBdl
         mEaQ==
X-Gm-Message-State: AOAM533KE4mMMJRKaStm4bA5021fjeZ5a3C102ucPRbO98ZpzI6HGy4a
	AFzx2GHboEJMuPlwwl19xZk6U6ExcyLHFR6c7o7asZcxlgwZAZgT4bXh+KdowYbL4dMk4Gyvdcj
	zXcm/GNw/xsbMMzmmk0NVrRvGzw==
X-Received: by 2002:a37:a08d:0:b0:69f:ca79:fa1a with SMTP id j135-20020a37a08d000000b0069fca79fa1amr686499qke.739.1652901127908;
        Wed, 18 May 2022 12:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDbUhSvdLu6JduxiW+/zvp4Y/NJimjXRgGY3vYkMFOTedCDN7rVz8EYfdtSQcjExQ9y0MW6Q==
X-Received: by 2002:a37:a08d:0:b0:69f:ca79:fa1a with SMTP id j135-20020a37a08d000000b0069fca79fa1amr686488qke.739.1652901127723;
        Wed, 18 May 2022 12:12:07 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:12:07 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 5/9] staging: vchiq_arm: pass vchiq instance to 'vchiq_get_client_id'
Date: Wed, 18 May 2022 15:11:16 -0400
Message-Id: <20220518191126.60396-6-athierry@redhat.com>
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

In order to remove the 'vchiq_states' global array, we need to pass the
vchiq_instance reference to the 'handle_to_service' function, as well as
to all functions that call 'handle_to_service'. This will allow
accessing the vchiq state through the vchiq instance instead of through
the global array.

'handle_to_service' is called by 'vchiq_get_client_id'. Therefore, pass
the vchiq instance reference to it.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 +-
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 7217e3070ffe..d6853e23564c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -398,7 +398,7 @@ vchiq_service_put(struct vchiq_service *service)
 }
 
 int
-vchiq_get_client_id(unsigned int handle)
+vchiq_get_client_id(struct vchiq_instance *instance, unsigned int handle)
 {
 	struct vchiq_service *service;
 	int id;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 5d9c2f787bad..45c3d7d1a86a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -599,7 +599,7 @@ void vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem, size_
 
 enum vchiq_status vchiq_remove_service(struct vchiq_instance *instance, unsigned int service);
 
-int vchiq_get_client_id(unsigned int service);
+int vchiq_get_client_id(struct vchiq_instance *instance, unsigned int service);
 
 void vchiq_get_config(struct vchiq_config *config);
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index adb616d97652..7e297494437e 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -788,7 +788,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case VCHIQ_IOC_GET_CLIENT_ID: {
 		unsigned int handle = (unsigned int)arg;
 
-		ret = vchiq_get_client_id(handle);
+		ret = vchiq_get_client_id(instance, handle);
 	} break;
 
 	case VCHIQ_IOC_GET_CONFIG: {
-- 
2.35.3

