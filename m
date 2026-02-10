Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E142EC0B4
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737199; cv=none; b=NJVtiDCIJGdBox/OUKsVfyTLs/QLu4mG+KMFlyzgm4lgeiOFdb8xlqPxJzhQi6MafJPlUtx2uP5RwboS8ZX8E+fvlKMGw9eqwnJOy1nKNV3PldieWqjlXXM5YT7TJ+q9/nCqHZM6WLL9Pt5cLWYO7n2+oAmaScQqr5q0GQ/w1F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737199; c=relaxed/simple;
	bh=gDxfFLU0qa20d1fsdCn4ZfwAdJigl5oOEUWywOkxol4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=arB8G9egfKtp9GxXO52mN7InWaWeabCz0EgP4Q/iLEuZgGrapEzGvrrFbK6gF5nFRPyF7gz8KNnKrKGGF4i5/bIFhaYpk2AB+d0k1QYxysZVw/FvNxGvGGDJ+HmxHnneesI6c0MCZMGmiBVyADdXhAiybAAdGo7CEpDvFIpn1+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WA0UbtT3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WA0UbtT3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 336CBC116C6;
	Tue, 10 Feb 2026 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770737199;
	bh=gDxfFLU0qa20d1fsdCn4ZfwAdJigl5oOEUWywOkxol4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WA0UbtT3DEbpevF5oY4nD9xTPsHLjKGb7UQnCHefX5hPUiw82V7Hh9Evm0xsBMp3q
	 IWbVJ7YVyOn6shXGRDDC8BATzR6hswfNQksDyzb4MRUyJHSwWaU9OzAuG4zC/qJspy
	 s4btvxeNApo8prhwZt1vF38oMOaN5LT8pWPvkcIc890l0M9A0YJ5zGN5Vg9DEkZiPz
	 T50jJaGLafoekvPhf4qIq9KoWF1WKxtm84M+m1Txmb0WWHgG/enQwlsuyXo26UDobN
	 U0s98ZK/8Gf7sqE5HBkoDZlbRtpTdyAcons/39LlJ1QQhiT0k/9tI8+tElISmK1OKb
	 eXqdqMR1lDooA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20467EA812F;
	Tue, 10 Feb 2026 15:26:39 +0000 (UTC)
From: Soufiane via B4 Relay <devnull+soufianeda.tutanota.com@kernel.org>
Date: Tue, 10 Feb 2026 16:26:31 +0100
Subject: [PATCH] staging: atomisp: fix heap buffer overflow in framebuffer
 conversion
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MD3cSS/NzM4gLdtMwKXYtUAwvjNHNTYzMLCyWgjoKiVKAw2LTo2Np
 aAMjY+oRdAAAA
X-Change-ID: 20260210-atomisp-fix-8e083f753688
To: sakari.ailus@linux.intel.com
Cc: linux-staging@lists.linux.dev, Soufiane <soufianeda@tutanota.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770737197; l=983;
 i=soufianeda@tutanota.com; s=20260210; h=from:subject:message-id;
 bh=02IOA1nCQPUgzJT/I1vQUUz6XZjDT1WpNqtxpsjfooI=;
 b=geFPqNN/T0BVfo4OYMZ3MxEJxzvH3LvSlXY88thCyVGuI7tvc2LId+BvyPTkgPJjyQvEs6WAZ
 9lUhugeSwnkDGY4aDnOrRTV5EnLI7RB8i//RlTqAZTPWVG+PNOuL8xi
X-Developer-Key: i=soufianeda@tutanota.com; a=ed25519;
 pk=UzU2pI3/kdLVX1NbSuU4LzRt28OBKkEmk+xBRMw7P+Q=
X-Endpoint-Received: by B4 Relay for soufianeda@tutanota.com/20260210 with
 auth_id=631
X-Original-From: Soufiane <soufianeda@tutanota.com>
Reply-To: soufianeda@tutanota.com

From: Soufiane <soufianeda@tutanota.com>

Validate sizeimage against the allocated frame buffer size before
hmm_store() to prevent out-of-bounds write.

Signed-off-by: Soufiane <soufianeda@tutanota.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..ca7ffc7855ac 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3326,6 +3326,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
+	if (arg->fmt.sizeimage > res->data_bytes) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	tmp_buf = vmalloc(arg->fmt.sizeimage);
 	if (!tmp_buf) {
 		ret = -ENOMEM;

---
base-commit: 72c395024dac5e215136cbff793455f065603b06
change-id: 20260210-atomisp-fix-8e083f753688

Best regards,
-- 
Soufiane <soufianeda@tutanota.com>


