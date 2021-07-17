Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB2672
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 09:58:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2726613D9;
	Sat, 17 Jul 2021 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626515903;
	bh=TrKiNGG3MVrXPbPPtaEXCeirrwTh8HLZ1ZlEna+hyoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bqA7T2VWNlgMpC0qYZYNdqeC9+v4mBOD25BZ5d6AWb9ZCrfk8vCTUCjxcGApvhEVj
	 dc63lOwLlxh3HF9KUpv9fTYA3rEEkrkcbNhd6pTQEnteF++SNHUixIERmS684rH/+f
	 GLVEmKuTjTBEgNJVEMHUlje27OUqbNtAT6qZgqSBQnZrn0gJiBOesqH0qPAEsul0y6
	 a1IhZaGWUhyvBzRUL0HTA+Ggui343N1S7DkOpc7Awi9otEwJz4k4KDSeehJeZZIwCz
	 /DzTuVuLpjT3P7SJcnd6XZwAD4bugpri3mwPoaaLky4WOfBRM69AkhbY3VUDTTkF3a
	 JQ1KmSb4P5nHg==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1m4h5S-0007KK-1Z; Sat, 17 Jul 2021 11:58:22 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v14 6/9] staging: hisilicon,hi6421-spmi-pmic.yaml: fix patternProperties
Date: Sat, 17 Jul 2021 11:58:17 +0200
Message-Id: <46b2f30df235481cb1404913380e45706dfd8253.1626515862.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626515862.git.mchehab+huawei@kernel.org>
References: <cover.1626515862.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The regex at the patternProperties is wrong, although this was
not reported as the DT schema was not enforcing properties.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
index 63f49080001d..cedf9d99a34b 100644
--- a/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
+++ b/drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
@@ -39,6 +39,8 @@ properties:
   regulators:
     type: object
 
+    additionalProperties: false
+
     properties:
       '#address-cells':
         const: 1
@@ -47,11 +49,13 @@ properties:
         const: 0
 
     patternProperties:
-      '^ldo[0-9]+@[0-9a-f]$':
+      '^(ldo|LDO)[0-9]+$':
         type: object
 
         $ref: "/schemas/regulator/regulator.yaml#"
 
+        unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.31.1

