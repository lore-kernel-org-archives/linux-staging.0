Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337734F47B;
	Thu, 13 Nov 2025 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038385; cv=none; b=rUd5Uu8MEEGM9kezT6DsrozNli5/G+0gEJi7KWsTIsBRXqKIwCQFv9jv2yfSEARPrrkviT3CTRv7mp4limenrC1299BUleyxkGUuN/ZusqkcnSIAx1yp+qRFIjF/t59/kj7WzoaoPq8arKfzU5PIszSsro/2FXuMofIla2OJyJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038385; c=relaxed/simple;
	bh=sOv3gpVFSUTOf8qccBUFlmorrQlW6YAkct0+Z3bQd3Y=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=SRwdSK4C1oTvyh+cJpiP3BaSHkip4wpXc/6u81W34k5xrzhnA4w8FYEteZKLwFcgC2GZgGak4/FZxd9H02Ij5lD/PJcgq3v53CZV4EYoL1V9DKM12X5SVkEqEbZwu/Hmr8IM8VcJ7vqa/HAoXxTUv1UFXvXKtqniT1UWCyfWbrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=GPte10Uk; arc=none smtp.client-ip=203.205.221.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="GPte10Uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1763038379; bh=/GQTtJfCoEQKgTxPit1J56QLlgdP/pwagyLI+EW9z0I=;
	h=From:To:Cc:Subject:Date;
	b=GPte10UksDW0uVsGPWgzOEPS5yhzbz4yxdSCBES7bVNEEWfBda4P4PlDtFsx+17IJ
	 DjYx3v5f1GCyKT2ewr5M8+uxSz4L+FkBbo1mWlQ/YgpgjUvPL11NBvYgaK9DLTEeyp
	 4GbfsmpVhgJ4r82Wkdc/8/zQkVDzDFZ5rCHWTt+8=
Received: from cjz-VMware-Virtual-Platform ([110.176.66.153])
	by newxmesmtplogicsvrszb20-1.qq.com (NewEsmtp) with SMTP
	id D393A6E6; Thu, 13 Nov 2025 20:52:57 +0800
X-QQ-mid: xmsmtpt1763038377towqfyh7c
Message-ID: <tencent_67481983755837947ADD1DAD8BB36FEF880A@qq.com>
X-QQ-XMAILINFO: MvUAcPkRmFBfRVa3KPbA1xUSqTPMJ44CrUz1iwiZsKDSpzjyo2Sr6sDvcPYZJm
	 3BCS7uVdl9iraSveiOzE24J4FEXP6h9eKDUWhHCK8JQWzJq5K9umCDt53NxJm3+CGnRUB5UA7CDt
	 OrCakPxHrv+iMXSznNA668OUpiBXzV54l97536ivDu803QZ2NpUi1KFu0FhMeAhowc+l71fONuzD
	 7MvPhZXcmakgsjq1HPg8mNiGpCn/d0ImziZlXh9v2/Np07jcRlCr42aNvw1YU5QlGvg/lmOsRaDn
	 kRpcbAvu7n+MQUrVaNQCtgYltagMKOqaN9dFhWJcjYv8l5JRTi4tDVsMAYF/LzcVdBm3yL5LoR9m
	 MNkeqlD5cKIZtJ+1XaujN0car7jyFZNAAYapo0k4wkwErrN6DBrH+zxjrPuvmh3nj5QRTrrEkzX0
	 oTvPXHrQ24XUkIij/zdPORFYYON/BpkSYO5tqBO+FRPPwTcy2B9fYlUGQBRxwt/jmQm4LfcnMrci
	 z4yeD7IwQ0PbsuOQbJsHBhmWcRUXt9ilH1Q9S9mkXegDt4vwB6TpBsDRUxE2dFInUmgUtNYQha+3
	 wpOqKpfoaejUEe0OhAjDTbrgaKwMKpouz7Oe+hQV++FsN/xV5wh53fAsG+qjAxIZPXrMEuZNJ304
	 rjQDPGtvZEpOopV08vIf2dcTxR1q6TCrxHB00FGz6bxXnWqaafpVD9Ra8gIlpPrQZwpsTJNowgs4
	 /ZVxLLuo9uDAjwlLfPvjuP2Giz6xQvYbl/ClNWqTsFnaZ8UVIWWs2viwrAjBiaaC7nSwx6/90LWB
	 E3DpoII47GmesnuhG2JuWc8tyKznCRbn9gaAwu2fzYsIooLoHlo+P9H19z0nkOKcjvRiaeH5bDDr
	 rpyFavu58U6mlSYcaM11VH0tYJ4h0FbLSRLl7/+lQGD3VAHPu7sh70iOU6av8bfLSTN51iLJeFRr
	 Wr8ccLMZkxGRW7lifrAoCz6zHdn46nfKllWRlr5URMLSoRn+GGq2amUZZfWOfb51mcULlx42+GA2
	 6V4xZbvgxp48AzW7Bs
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Chang Junzheng <guagua210311@qq.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guagua210311@qq.com,
	Chang Junzheng <guagua210311@outlook.com>
Subject: [PATCH] staging: greybus: audio_manager_module: make envp array static const
Date: Thu, 13 Nov 2025 20:52:52 +0800
X-OQ-MSGID: <20251113125253.72693-1-guagua210311@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chang Junzheng <guagua210311@outlook.com>

The envp array in send_add_uevent() function is declared as a non-const
local array, which triggers the following checkpatch.pl warning:

WARNING: char * array declaration might be better as static const

Change the declaration to 'static const char * const' to improve code
safety by making the array read-only and allow for better compiler
optimization. This follows the kernel coding style recommendations.

Signed-off-by: Chang Junzheng <guagua210311@qq.com>
---
 drivers/staging/greybus/audio_manager_module.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..ca6a2cd0bc4f 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -159,14 +159,14 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	char ip_devices_string[64];
 	char op_devices_string[64];
 
-	char *envp[] = {
-		name_string,
-		vid_string,
-		pid_string,
-		intf_id_string,
-		ip_devices_string,
-		op_devices_string,
-		NULL
+	static const char * const envp[] = {
+						name_string,
+						vid_string,
+						pid_string,
+						intf_id_string,
+						ip_devices_string,
+						op_devices_string,
+						NULL
 	};
 
 	snprintf(name_string, 128, "NAME=%s", module->desc.name);
-- 
2.43.0

