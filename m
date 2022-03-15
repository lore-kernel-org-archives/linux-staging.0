Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3E7A
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 20:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647374984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzuNLYDsbc4LQ+eCCeLM8v+rRX11qjhaA0tgT5aZNJM=;
	b=EAS41bcUbfFSlGAajx5zmeenhVUHa+6ChfwWS6cw1k0uVFj5AZ/83WvFdy6WysuqMnvR/7
	5uQqtWApO76gSC9gWL7SD0RjiYbxNnsKwd73Rd0PRt2aQHV5sZQKucMjC054QXW+Ej76tk
	Drrpsq8mQ/2oEkwXVKzfAVN3w3MjEq8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36--jSfna0PMtCf2SL6sfnnvA-1; Tue, 15 Mar 2022 16:09:43 -0400
X-MC-Unique: -jSfna0PMtCf2SL6sfnnvA-1
Received: by mail-qt1-f200.google.com with SMTP id bb15-20020a05622a1b0f00b002e06ae2f56cso112171qtb.12
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 13:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gzuNLYDsbc4LQ+eCCeLM8v+rRX11qjhaA0tgT5aZNJM=;
        b=EDQxMJc26TCjlh7aY/obaQu6W/u5TIYqAki+Y7q2KJAUou/LyhkC9dXaC14M0XLGM9
         DHTSR2Gvnnd0leD/SeTCldx9BZ9QjF1kuUuJALFuwPOeI8RT5+WXrozK/j9CGB0NUUCh
         DkK2vMM9jLcqB/aahtmUwehJI01dC1coGf186ksJ4XLNJNOPbkhApBDf2y4Q8OvyWj8S
         HJuQw+8J+6dmCyuwZA+DmOo6U0ImUPEEIdZPnn+njlpfes+G0zQCgM5o9sqijt+ZX4QX
         TwDpWRrvKW0sKBcySMNmoYNsrAvso2/UAuOdP7zsuoBTQUt9qzWV+CLM8qFbiBhHWhnB
         Qx1g==
X-Gm-Message-State: AOAM532M3ah+oCvrCrR5B09FnpwjboAvMd0Z20oQP9JsJspTmwXjjpce
	4jXGLr/XJinH5/pFEQi0EiTcOhWJkE2hNzY242Y/EROks2SwBd9NAkaJKWGLIoXQJc6MJ3uJVWv
	Iy3HkL3kuHe+/Djwdigg1DNYZBQ==
X-Received: by 2002:a05:6214:2021:b0:435:c2f0:817c with SMTP id 1-20020a056214202100b00435c2f0817cmr22526831qvf.1.1647374982637;
        Tue, 15 Mar 2022 13:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQGJ2hEhXw4BbiMPJAtVDm4Wh2ugdd8oUEZ2eae1W1C3kjSaJzxn/pmqNT6dQ+bbCeD+X7BA==
X-Received: by 2002:a05:6214:2021:b0:435:c2f0:817c with SMTP id 1-20020a056214202100b00435c2f0817cmr22526815qvf.1.1647374982483;
        Tue, 15 Mar 2022 13:09:42 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id 197-20020a3703ce000000b0067af869ffa6sm9582433qkd.127.2022.03.15.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 13:09:42 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Adrien Thierry <athierry@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <stefan.wahren@i2se.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: soc: bcm: bcm2835-vchiq: Add support for bcm2711
Date: Tue, 15 Mar 2022 16:09:28 -0400
Message-Id: <20220315200929.74952-2-athierry@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315200929.74952-1-athierry@redhat.com>
References: <20220315200929.74952-1-athierry@redhat.com>
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
Content-Type: text/plain; charset="US-ASCII"

Add a new compatible string for BCM2711. This is the chip used on the
Raspberry Pi 4.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
index e04439b3355b..599bd283df1b 100644
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
@@ -27,6 +27,12 @@ properties:
               - brcm,bcm2836-vchiq
           - const: brcm,bcm2835-vchiq
 
+      - description: BCM2711 based boards
+        items:
+          - enum:
+              - brcm,bcm2711-vchiq
+          - const: brcm,bcm2711-vchiq
+
   reg:
     description: Physical base address and length of the doorbell register pair
     minItems: 1
-- 
2.35.1

