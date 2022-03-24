Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A67A23A0
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 17:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648142825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FuZsMHesHkwyF+f4SfnxOtgM2hC6A+pYUGF0YW0O7oY=;
	b=KRBsHXS/Zqj5ua8ObBJClA1+4YJ0aGvmBONcQzXcdHNdRWp72VaoECLMqu1NR7EgKLyduW
	b+PawB/llcUfPBI/aF6Ah6Jj4kD/9xJKnWtPdUrOuKR2EDIpyY4YUzhmg0iKw8d6Clqh3l
	A0gAf1fD6oshnnetqyOMMKoA5uy2qcE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-MSsRJsWSPAudBbpbuIaZtA-1; Thu, 24 Mar 2022 13:27:04 -0400
X-MC-Unique: MSsRJsWSPAudBbpbuIaZtA-1
Received: by mail-qk1-f199.google.com with SMTP id o15-20020ae9f50f000000b00680a61f51c4so1050494qkg.15
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 10:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FuZsMHesHkwyF+f4SfnxOtgM2hC6A+pYUGF0YW0O7oY=;
        b=FFEgDfGk1T7v9DXsAGn1nPOi+16sV6LkYfHWPWnAGBYBEbyEILqBT0iJK++njK/Xqq
         3mnEv9wl7fx+6wLsXHGK1uNAph3FcGd+qTv+tcT11rrvQqgxXCM+QbGl7SIMezdr77Ju
         8PDOBSy78+Xkl0yuLCWgPFNUSvPmq26/1F4E0ZYXNz3VIWPfaYpkQ8oyUxpDpLuGZzHN
         HitJjUSPwoAbVoYuAYvSziYMdOZLok/st2ZhTQCOJfAiQeoqkcAJ/cxDnDIfpFcqDd4h
         5+HH6UeZEoOVhpkx5ZWhRL7OsTDCmT0Uz0YBKtSzo86LoGxtQOLlNSDqh0OwFzX+7WCV
         Fejg==
X-Gm-Message-State: AOAM530oaYHfL5uu1mao9XL0nKwQTKf/Ku6GXWezxBbrxCJQtNCAL+c6
	WgHYq339LoM6kqYHmHS71c76vtQf+lqYNj/2YwZdlXe6rJ7lbZskA/aXZeiVF1ZkoHI/LzY8/cB
	clpFa1IG2hBfFiwDCwC0ED45h8A==
X-Received: by 2002:a05:622a:1cb:b0:2e2:27da:74c4 with SMTP id t11-20020a05622a01cb00b002e227da74c4mr5570091qtw.462.1648142823613;
        Thu, 24 Mar 2022 10:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB3fqgMHNs7WS6KwTaNhgQHa0SyJ45xcvpPfz8cy6zRHaIw7naxDTmXdL5flaBJsQuUOU2Zg==
X-Received: by 2002:a05:622a:1cb:b0:2e2:27da:74c4 with SMTP id t11-20020a05622a01cb00b002e227da74c4mr5570066qtw.462.1648142823425;
        Thu, 24 Mar 2022 10:27:03 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id bm21-20020a05620a199500b0067d5e6c7bd8sm1886515qkb.56.2022.03.24.10.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 10:27:03 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: soc: bcm: bcm2835-vchiq: Add support for bcm2711
Date: Thu, 24 Mar 2022 13:26:46 -0400
Message-Id: <20220324172647.167617-2-athierry@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324172647.167617-1-athierry@redhat.com>
References: <20220324172647.167617-1-athierry@redhat.com>
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

Add a new compatible string for BCM2711. This is the chip used on the
Raspberry Pi 4.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
Changes since v1:
- Removed duplicate compatible string for bcm2711

 .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
index e04439b3355b..9cb957facae0 100644
--- a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml
@@ -27,6 +27,11 @@ properties:
               - brcm,bcm2836-vchiq
           - const: brcm,bcm2835-vchiq
 
+      - description: BCM2711 based boards
+        items:
+          - enum:
+              - brcm,bcm2711-vchiq
+
   reg:
     description: Physical base address and length of the doorbell register pair
     minItems: 1
-- 
2.35.1

