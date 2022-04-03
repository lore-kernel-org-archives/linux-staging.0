Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE123B2
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 22:27:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1649024861; h=Content-Transfer-Encoding: MIME-Version:
 Reply-To: Message-Id: Date: Subject: Subject: Cc: To: To: From: From:
 Sender: Sender; bh=y5ltD1YbS8stWfMw6OYDAa9OeNCMcSjpNZgM56D6GYk=; b=Xxl2VY1OrPHJhMFeY5ihF39zr7wbkDVUvqM7J5Oz7gibHA9wpVTE5pOj8NtqKYrH7rzrNN7R
 w7wudHcdx5cFquWBq1gl5fkvL5YImr+KxOgZfGaxpG2sz4EFP1lmQboIJudpRiibLLbfG8T9
 zkF8Up5ORNS16xUOYMOYvSo1B6hHqh2ufV1+4gy/M204TCeVnC+AMeggcD8wxjJxsh1mlqKu
 +6n7y2UKU6gC+9QB2UWozJo450ugF3MwR/aX7cPVnjrVyJF4wIZu64kMRSqxEHFapUGJOPJa
 huBtE++yvokR3XX6s5jLvqffgRljt03LUB/lEfH+PqFjSv94qKTiaA==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from localhost.localdomain (177.75.142.174.mhnet.com.br
 [177.75.142.174]) by smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 624a1f5ccb3e04acafb2af84 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 03 Apr 2022 22:27:40 GMT
Sender: codeagain@codeagain.dev
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Subject: [PATCH] staging: vme_user: Fixed typo in the MODULE_AUTHOR
Date: Sun,  3 Apr 2022 19:27:28 -0300
Message-Id: <20220403222728.276111-1-codeagain@codeagain.dev>
X-Mailer: git-send-email 2.35.1
Reply-To: Bruno's Patch Box <patch-reply@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MODULE_AUTHOR line missed the '>' character in the end of the
author's e-mail address. Just added it.

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
 drivers/staging/vme/devices/vme_user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
index e3fa38bd7f12..859af797630c 100644
--- a/drivers/staging/vme/devices/vme_user.c
+++ b/drivers/staging/vme/devices/vme_user.c
@@ -773,7 +773,7 @@ MODULE_PARM_DESC(bus, "Enumeration of VMEbus to which the driver is connected");
 module_param_array(bus, int, &bus_num, 0000);
 
 MODULE_DESCRIPTION("VME User Space Access Driver");
-MODULE_AUTHOR("Martyn Welch <martyn.welch@ge.com");
+MODULE_AUTHOR("Martyn Welch <martyn.welch@ge.com>");
 MODULE_LICENSE("GPL");
 
 module_init(vme_user_init);
-- 
2.35.1

