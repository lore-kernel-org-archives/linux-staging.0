Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE5F2FB0
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 10:53:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2971611C2;
	Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621162433;
	bh=6OJg+K2TbVrabosKaDhINUNxeweXhLVzeNm4qRXzVlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDHxZiC8syfSVl4jRHZlSzHvDQIDBni7K+kT4T9s82fFYgHZ7jnBe2PJn5MzGhn65
	 N7tOeVPifZsQx/TUSf7MKrL0FFjyTS+3P7h9pZSUE7Y1VLrZNp+UOnRVQuh5stYIgO
	 gKBdI/sQIrf5LF6VvWQLZOvUN7Jpo/Kmd8qEjEQP+xKWHjTn4M0lkL+CLVJKTgZbD5
	 nXIyhsZH6sfTunkLEgvY01IO+33//imp6086zZgyHal0Jn4xuCTYeOyfn8RS63gH+j
	 VXXXK1obvZ8M5o+HeQcXcdn52X/8Nupw3SemWqbRxsVXeka7aJMIHAm1xGGSdGqfRJ
	 HH9DLn+Zxm/QQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1liEP9-003s8a-23; Sun, 16 May 2021 12:53:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Pavel Machek" <pavel@ucw.cz>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/17] staging: nuc-wmi: get rid of an unused variable
Date: Sun, 16 May 2021 12:53:38 +0200
Message-Id: <e032b4e902d7a5466457b54b9f779d5378ab35f8.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

	drivers/staging/nuc-led/nuc-wmi.c: In function ‘nuc_nmi_cmd’:
	drivers/staging/nuc-led/nuc-wmi.c:242:6: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
	  242 |  int size, ret;
	      |      ^~~~

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 8967c8d54dac..78b0a3279f25 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -239,7 +239,7 @@ static int nuc_nmi_cmd(struct device *dev,
 	struct acpi_buffer input;
 	union acpi_object *obj;
 	acpi_status status;
-	int size, ret;
+	int ret;
 	u8 *p;
 
 	input.length = NUM_INPUT_ARGS;
@@ -281,8 +281,6 @@ static int nuc_nmi_cmd(struct device *dev,
 		goto err;
 	}
 
-	size = NUM_OUTPUT_ARGS + 1;
-
 	if (output_args) {
 		memcpy(output_args, p + 1, NUM_OUTPUT_ARGS);
 
-- 
2.31.1

