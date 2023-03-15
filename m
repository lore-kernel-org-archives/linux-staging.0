Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ABF539D;
	Wed, 15 Mar 2023 13:43:47 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id eh3so19823643edb.11;
        Wed, 15 Mar 2023 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678887826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8nh4Kc6jJ9l/Mp0JruEeJEXn/89g6G123aMhw5HP3k=;
        b=OipumGshDKwsZwzV4aU+QHJNrrpy/7K9lhhshAN9OE7SVKmxV+go2d/XqE8WOSq8/j
         E2JNKsUG2JuukEtHIqSWIJGuuEgiTStO7cvsZp3P0qnRGJJZ0mKf9iiW6PQ4hHXflBej
         0IzbRvMaItVXSJC9UJ9vVvBfbYBsxlgjpC4rOLH12WbZoISFbxFoB48E5h4MVW2S4ADg
         4C7Jp0/o9qlH008hyn+p1/MHdd/yoz6/8uaeVI9vw3+e0RFlso2ZZiQIj56M3luUjEhs
         dAKDkhueZXzDSmMJwBif3gwza1EnH8cSBVXBDgpQhF7v2VdJ9rC+Dcc0WKIf1TS2FKlU
         /MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678887826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8nh4Kc6jJ9l/Mp0JruEeJEXn/89g6G123aMhw5HP3k=;
        b=1oDJUc0ya7avSqNkW3vwxMRL9pWh/eUXgXq1nyhK3lPWo6j7DGEXd/JyFWGnXCSQsU
         pg1/TuoOwp5VfVfIpQCnZLzT0AeYcUyAEEQcus4g0+F3aOOtWZK552213ROOHTCFZnS/
         BBM3AD87GkGiVdaD3T2Zp8RTTi0F2GKMyi4K3CUi9BzMATYXbUOZxoWmqvU59+MZL9iq
         Tg1XMKDzvP3sgIDalshbsl5Jt1ONvvheTm+ZDsdgmA1eO1ItuJiKwYFIWZMId4MjDdAB
         m1OuCDpT58mt85lPIrV/YxVMki4RdAn6Bc/y3eT49wKitUFeQxhhOzKEDrXdCHLddSkq
         YoBQ==
X-Gm-Message-State: AO0yUKUti7wUIHt8KwoDsFUvW8nAdMLufFUlcosCuGyt+bvbFe6DzVEN
	KQPAw18ch3ySnef1nJ6Bugk=
X-Google-Smtp-Source: AK7set9QobhoIVVuJG/Pjp3I8olNsGgGSkQlozO6tUIt8bmpIs0i24ILEUFNFfhwoSt6fE7y9SE9Fw==
X-Received: by 2002:a17:906:c18b:b0:8f0:143d:fa4b with SMTP id g11-20020a170906c18b00b008f0143dfa4bmr6001641ejz.7.1678887826138;
        Wed, 15 Mar 2023 06:43:46 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id a12-20020a1709066d4c00b00914001c91fcsm2546201ejt.86.2023.03.15.06.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:43:45 -0700 (PDT)
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
Subject: [PATCH v2 2/2] staging: vme_user: remove unnecessary blank lines
Date: Wed, 15 Mar 2023 15:43:29 +0200
Message-Id: <15b80b699315993d7f0da638f805446f6dc0b480.1678887330.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4bdfd864b573c164df30ec738afc93b06ce0d573.1678887330.git.eng.mennamahmoud.mm@gmail.com>
References: <4bdfd864b573c164df30ec738afc93b06ce0d573.1678887330.git.eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unnecessary blank lines before a close brace
as reported by checkpatch script

"CHECK: Blank lines aren't necessary before a close brace '}'"

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
----
changes in v2:
	edit commit message
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

