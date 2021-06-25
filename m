Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42D6D11
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47E0B6141C;
	Fri, 25 Jun 2021 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624607172;
	bh=Z7clAz4iJbT7z/W2XZ8uk8GPACguI/8XqnWeaDjkd20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOaCEIUhTwM2+Lziv8DUdSFhpR7ALklZi2bzr3rMdDSGdAvUBzs79yv2PsR+kwJuh
	 KXkKZymHpUZ1rHY4zpupbKTIYX95R8W1nElf5GVECe17LbrSHjNC66wX+aix9a546c
	 0gTaxWGjVvZVS8BhyUlm1uWgTSTO9yNnGunqEDjRHwxYv6zHM5XCz+KABH0IQfyYFZ
	 7zftaEp3SX6j1gbU06YNbrPqFNSjeDhF7vqKr90bq+E2p8VJ6+9Oy5b21VjQLdVX9C
	 ihh8SSOQJ8KzlpAIrAmKZOm9ICVM3WQH1UddRPGX5LTD5SnHvPn4z9CST6H7dnnNYO
	 QN3fZgzLa4vdw==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1lwgXS-004aeU-Gh; Fri, 25 Jun 2021 09:46:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Lee Jones" <lee.jones@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v8 07/12] staging: hi6421-spmi-pmic: change a return code
Date: Fri, 25 Jun 2021 09:45:59 +0200
Message-Id: <e978eabd99c0d3c471026659a2c585deb706e2c4.1624606660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624606660.git.mchehab+huawei@kernel.org>
References: <cover.1624606660.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

return -ENODEV if irq_create_mapping() fails at probing
time.

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index be049a5abbcd..3f4bfeaaf05e 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -245,7 +245,7 @@ static int hi6421_spmi_pmic_probe(struct spmi_device *pdev)
 		virq = irq_create_mapping(ddata->domain, i);
 		if (!virq) {
 			dev_err(dev, "Failed to map H/W IRQ\n");
-			return -ENOSPC;
+			return -ENODEV;
 		}
 		ddata->irqs[i] = virq;
 	}
-- 
2.31.1

