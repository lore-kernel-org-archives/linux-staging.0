Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138957F
	for <linux-staging@lists.linux.dev>; Sat, 28 May 2022 20:28:33 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id b8so1155805edf.11
        for <linux-staging@lists.linux.dev>; Sat, 28 May 2022 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=rKUdcZ5+CPg7gfBlzCJZPvk1sAk9u+GiolWKz3aKZJ4=;
        b=TcMj9I52z4nW4O9auyhU4iqIfkK7jNDvixcbtcVHG9vj2K5PhDl2EZK9gE+oSmtNNa
         i22jzxGDHIY7sJoNIGFsCjsmv7xYgCZyzhTgF0h+F8lM4PE5SgmmM1FMH4VdAY5SMpjh
         mZxiFg2rElYM6TeKG509eyjFm3df+Bd1oSD6HLQxfxHybfEksBBUp9mfz/f0hoWIkxqf
         pm90WAo/IvhtaAgcHAr4hhVC+v3J1Vi4ZRcUehoNFw9KkgojX4qNeB9RlJuLOUAIt3Hw
         S9z0Y9VBTQOx1CEIufx+d6WPhWLvjnVHkKrszXGSZAXbEcEKxg2y4mVbTpt2nZ8pJY24
         dNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rKUdcZ5+CPg7gfBlzCJZPvk1sAk9u+GiolWKz3aKZJ4=;
        b=wM26qVRgPIMJ48sgioQMhyGQtRaURrhR7oJs8zDOtuJK0mEx+Cf43Rq/A4igRX8fpM
         zmjYszh4Ysjl8PRNgnJ4RLACPZGpBnp6f3GYRiNmLoQeDEnghzp99afw/E9dTykJLWXY
         igcAk6UFZtl8ILLYZTNTGkftelYwVKiU+bSvNXFMhTb8OMXPnDmfsfln5aR8jtPaMRIV
         yW8IBuuBT/E7XKIwG6b1ESBjqbVRZuYbt8wxz26WH/V+veGtauAmXEUGpbPcK4DzDPuJ
         RfMG/KGHpzifj9/JRC45csXIUFCUJ4pwqXaLz8YmaCnB1QUmlXG4itd8pgKC4Yujo3tZ
         VD4w==
X-Gm-Message-State: AOAM533/h/6elFzbCsQ0HZULVz6mqDR01jYeCyYHqA0fkkvFuh0DxsBE
	k8pUj5Yp0b5T5/ftahkiJzFtQYU1Ew4=
X-Google-Smtp-Source: ABdhPJzuDEVEW7U72D6+nmZQHvZ+ZHGh7iZZzNYJFbDloCZtN9XijZIbaZRNoT/ru2QE0bhww24c5Q==
X-Received: by 2002:a05:6402:1912:b0:42b:615e:6025 with SMTP id e18-20020a056402191200b0042b615e6025mr33758049edz.152.1653769712131;
        Sat, 28 May 2022 13:28:32 -0700 (PDT)
Received: from nam-dell ([2a02:8109:afbf:ed88:bd8e:fdbc:fec6:5b2e])
        by smtp.gmail.com with ESMTPSA id v27-20020a50d59b000000b0042aae307407sm3833779edi.21.2022.05.28.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 13:28:31 -0700 (PDT)
Date: Sat, 28 May 2022 22:28:31 +0200
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vt6655: remove unnecessary type cast
Message-ID: <20220528202831.GA129473@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove le64_to_cpu(), as the type is already u64, as reported by sparse:
drivers/staging/vt6655/card.c:758:16: warning: cast to restricted __le64

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 2cde0082fc03..852300c59980 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -755,7 +755,7 @@ u64 vt6655_get_current_tsf(struct vnt_private *priv)
 		return 0;
 	low = ioread32(iobase + MAC_REG_TSFCNTR);
 	high = ioread32(iobase + MAC_REG_TSFCNTR + 4);
-	return le64_to_cpu(low + ((u64)high << 32));
+	return low + ((u64)high << 32);
 }
 
 /*
-- 
2.25.1

