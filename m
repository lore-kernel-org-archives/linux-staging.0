Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2613853BD
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 02:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7ueL3bx"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6b201a93c9cso2986509b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 19:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697510149; x=1698114949; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adVf8A3/crcNLY+ksyRtmx34jr6J2QTaDzuwLDhSC/s=;
        b=F7ueL3bxtaLhbHUsC0j2wPSMVB4Wje70HSs1m12Rys73eBPJC4G289e3TyfPl9VYfc
         3qQT0Q0o9p7dVNzIR9Gv7rIa4JUxHSVymrf6ZkrksUFFAHWvp9o4ajMcKk3RlRkQt+oX
         t5qcxqrIA0hJlUqL+WaY4pax/a5mxBGjbnVRfATjLYuRQob7+h9k8o3wo2jnV5WxYJf6
         hmtxB4114nvQ5GuGoI3pLwplzpVFpANEgOJfTsDCUVlzM0f4yWf1qnfS9DsKivnvAEj5
         BexJFiW40flc+g6520MBOHlftufXeWTRH5HDXOoB2B527SUbm/JszIqjrGZ7zYKytUyr
         y/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697510149; x=1698114949;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adVf8A3/crcNLY+ksyRtmx34jr6J2QTaDzuwLDhSC/s=;
        b=uNKlOKYmQoqFbJ5Gi5bKzbP55C2DNK12cNNh3K+cWTLLjYyJ7froMNnRP7xytHfoz4
         hcj7TMsCO/q8qMHGQDTCElCehpc38bWTymTze8XRlkKoLOC3sVhXnU3VNRLqMnjLzYsA
         yrBG/zFWycTBeA8xSFPvbbDDMT8u3NHLOE3KB9L8DCxmC45iAb6TpjdUGQNTcPz3HQ+w
         UPHe683eqCSwoWUyMqNrn8aNeaJYApfCiZ8Vg2LnacgJZdWbjmdXb1o1oelJl8QVix3u
         8oo+O7Xta4aXXSl0FjAjKrPfZWdbMtIZLte1q86LgtLD8HXRmEtTnzhrlw44hEEkM33K
         Bthw==
X-Gm-Message-State: AOJu0YzaC+9Ev1cetdoO5m3Amqnx2HQ6/FsROugnBo4QZBmpnfz6FTd1
	3VCsCY2BXNBKTlgY08T81KA=
X-Google-Smtp-Source: AGHT+IGsxCdNX8EsBwdlLG99DRr/sy9DKnvwetQovuD3b+34tn5DtoIYTWI4DKjHRYl0JJQ2+vjVbQ==
X-Received: by 2002:a05:6a00:158f:b0:691:2d4:23b2 with SMTP id u15-20020a056a00158f00b0069102d423b2mr1185579pfk.15.1697510149277;
        Mon, 16 Oct 2023 19:35:49 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id x28-20020aa79a5c000000b0068fb9f98467sm248234pfj.107.2023.10.16.19.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:35:48 -0700 (PDT)
Date: Mon, 16 Oct 2023 19:35:44 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Modify lines end with a '('
Message-ID: <20231017023544.GA6684@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Lines should not end with a '('

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/audio_manager_private.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_private.h b/drivers/staging/greybus/audio_manager_private.h
index 2b3a766c7de7..daca5b48b986 100644
--- a/drivers/staging/greybus/audio_manager_private.h
+++ b/drivers/staging/greybus/audio_manager_private.h
@@ -12,10 +12,9 @@
 
 #include "audio_manager.h"
 
-int gb_audio_manager_module_create(
-	struct gb_audio_manager_module **module,
-	struct kset *manager_kset,
-	int id, struct gb_audio_manager_module_descriptor *desc);
+int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
+				   struct kset *manager_kset, int id,
+				   struct gb_audio_manager_module_descriptor *desc);
 
 /* module destroyed via kobject_put */
 
-- 
2.25.1

