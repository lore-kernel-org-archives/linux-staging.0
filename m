Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F38D4431;
	Wed, 15 Mar 2023 12:22:18 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id cy23so74601895edb.12;
        Wed, 15 Mar 2023 05:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678882936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=an/apiKnnf6j37nOP1Xq7Z6MZ50pKDsSAi66GrBqtBc=;
        b=mVL65eONLHYX1OUZQduFPTkQaS+ywjuG0/rfDmFAzZZtj/tsrnmbkFB/zPzvhJ/0pW
         WFIbCKWRcEw9a1h1LQR57+XEWW/rAKz4GBQkhJRVGx74FIpw7fo7Y+MPvWj1O3TzpFI+
         Y8WEuHcpKbv9XQx+vOq9k+dKKhMmbiD7MQR33VGu7zbKSxj+Uy6SUGpytdOidCIjLnlT
         oarwnuf2C1N4ZwT9903xAtBAxVt+EJQptm0FIT/YcDbWOZ2glt6SSe28rS5jPdjd+YQh
         eXoCBE3S1j4fq2J8wfNkm9jcrIBHOajhGKaTTNepQyVCLRF08Wojl2QWGl3YSHqeaPMO
         Sopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678882936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=an/apiKnnf6j37nOP1Xq7Z6MZ50pKDsSAi66GrBqtBc=;
        b=JVmkfoi43uMlE1dLOInqaXiTnMlLoDz3HNlOpPwfwI1sir5ES0jEPWK0lYGWNDsgrq
         CX7F1vS19knfsoJAx3CjWOnHbskb0Uh8CP/pfjaoAb8jXWJ1oF3eej7U7mc8s5QqtwXT
         2XmIjsX9R8iG+pPSzZ6WSoiiEqvt3QGT9yVGJglsnGDn2R5c8oe8ph6EXWiEOOThuthO
         AWs+HeBn2l5hPMH1mo9Fhaek5RTPvFWG/QIworuw+WgI2PZR47h6nr0I3a2PM/NKAXnD
         YahxSahMbXygjE3aMIncevkzStRXKfDqcRasFltL5BYlpuyNUws4FNWOhPPNyvtNs8rX
         MRvA==
X-Gm-Message-State: AO0yUKUaZeL/N+2ctekY9ky0wb9COIO63Er62BE1IzwqMZVnNg0C0zKq
	X01HplXngw/yl2sQhh5oqP4=
X-Google-Smtp-Source: AK7set8PENzz3XTAQa0XPJGPYXvNL9r5nhBLH8iTnJBN4c3tp7zSVnXIUQp4eJYdE7FZqQxe52VyCA==
X-Received: by 2002:a05:6402:14da:b0:4fd:2b0f:8765 with SMTP id f26-20020a05640214da00b004fd2b0f8765mr2058408edx.12.1678882936442;
        Wed, 15 Mar 2023 05:22:16 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id m1-20020a50d7c1000000b004fc856b208asm2383663edj.51.2023.03.15.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 05:22:16 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	zoo868e@gmail.com,
	jerrykang026@gmail.com,
	cuigaosheng1@huawei.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH 2/2] staging: vme_user: remove unnecessary blank lines
Date: Wed, 15 Mar 2023 14:21:33 +0200
Message-Id: <8958127fc8fdb4fede7867f38579578af924b719.1678882204.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b56c7b94e59a4051373af8b5d90a0685dfc9233a.1678882204.git.eng.mennamahmoud.mm@gmail.com>
References: <b56c7b94e59a4051373af8b5d90a0685dfc9233a.1678882204.git.eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unnecessary blank lines before a close brace
as reported by checkpatch script

CHECK: Blank lines aren't necessary before a close brace '}'
+
+}

CHECK: Blank lines aren't necessary before a close brace '}'
+
+}

CHECK: Blank lines aren't necessary before a close brace '}'
+
+	}

CHECK: Blank lines aren't necessary before a close brace '}'
+
+}

CHECK: Blank lines aren't necessary before a close brace '}'
+
+}

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index bfa604043355..2f5eafd50934 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -1023,7 +1023,6 @@ static int tsi148_master_set(struct vme_master_resource *image, int enabled,
 err_res:
 err_window:
 	return retval;
-
 }
 
 /*
@@ -1741,7 +1740,6 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
 				  list);
 		prev->descriptor.dnlau = cpu_to_be32(address_high);
 		prev->descriptor.dnlal = cpu_to_be32(address_low);
-
 	}
 
 	return 0;
@@ -1773,7 +1771,6 @@ static int tsi148_dma_busy(struct vme_bridge *tsi148_bridge, int channel)
 		return 0;
 	else
 		return 1;
-
 }
 
 /*
@@ -2220,7 +2217,6 @@ static int tsi148_crcsr_init(struct vme_bridge *tsi148_bridge,
 	}
 
 	return 0;
-
 }
 
 static void tsi148_crcsr_exit(struct vme_bridge *tsi148_bridge,
@@ -2530,7 +2526,6 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	kfree(tsi148_bridge);
 err_struct:
 	return retval;
-
 }
 
 static void tsi148_remove(struct pci_dev *pdev)
-- 
2.34.1

