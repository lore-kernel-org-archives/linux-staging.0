Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0139EF22
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268259; cv=none; b=cfBZPSuJ3slonscT+812HEyT8KOrkDZTa24gkSld8kD/2aFzaCKrkh7r6GVxbSJNJTHPJkQrE4rSKF5+6NkDSOyIicN/QiXKsxEq2aJUpQWHfVaxmsrbvmzCGZ8BEuOlCk9l336641IgiCr02nvGi0OEemgLJP2E02m8Z9MP1mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268259; c=relaxed/simple;
	bh=VV0N9wPRfaXAewOcHWQMsOPmN+KTLUmrSZiNx0uAXQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+uiMqLBAjoXfVbkK/xq8iiyGhzm346mdq1uODqGttVbRVvjOkv4n8EK0CCUuRoeeA/n+55dn7WpfFQI+/yyyKjMefh0zNrBu7cJOWwxrsOyEn9Lr9xH1AvVW7K0EaQWRSO3QGQrTIPeFvcNrmmf/v+CJnFxHISGJaWnzI6QNgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAD32uFbL8FpYYuMCw--.3502S2;
	Mon, 23 Mar 2026 20:17:31 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: andy@kernel.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	pengpeng@iscas.ac.cn
Subject: [PATCH] media: atomisp: ov2722: flush buffered writes before they overflow
Date: Mon, 23 Mar 2026 20:17:30 +0800
Message-ID: <20260323121730.75257-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD32uFbL8FpYYuMCw--.3502S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar47tw4UJF4Duw1xAF43ZFb_yoW8Zw4Upa
	yrtan5GrsrXryUuanxA3Wxt3WrKwn7ta47C3y8ua4xuw1ftF40gwn8Ka4UJr98Wr97Ary2
	ya15WFW7uF4DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUsNVkUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

__ov2722_buf_reg_array() appends 8-bit or 16-bit values to the buffered
register-write payload and only checks whether it should flush after the
new value has already been written. When ctrl->index points at the last
byte of the fixed 30-byte data buffer and the next register is 16-bit,
the helper writes one byte past the end of the local buffer before the
flush threshold check runs.

Check whether the next value fits before writing it. If not, flush the
current buffered write first and then append the new value.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..691192d096fe 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -169,26 +169,42 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
 				  const struct ov2722_reg *next)
 {
 	int size;
+	int ret;
 	__be16 *data16;
 
 	switch (next->type) {
 	case OV2722_8BIT:
 		size = 1;
-		ctrl->buffer.data[ctrl->index] = (u8)next->val;
 		break;
 	case OV2722_16BIT:
 		size = 2;
-		data16 = (void *)&ctrl->buffer.data[ctrl->index];
-		*data16 = cpu_to_be16((u16)next->val);
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	if (ctrl->index + size > OV2722_MAX_WRITE_BUF_SIZE) {
+		ret = __ov2722_flush_reg_array(client, ctrl);
+		if (ret)
+			return ret;
+	}
+
 	/* When first item is added, we need to store its starting address */
 	if (ctrl->index == 0)
 		ctrl->buffer.addr = next->reg;
 
+	switch (next->type) {
+	case OV2722_8BIT:
+		ctrl->buffer.data[ctrl->index] = (u8)next->val;
+		break;
+	case OV2722_16BIT:
+		data16 = (void *)&ctrl->buffer.data[ctrl->index];
+		*data16 = cpu_to_be16((u16)next->val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	ctrl->index += size;
 
 	/*
-- 
2.50.1 (Apple Git-155)

