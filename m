Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182E725CC79;
	Fri, 14 Nov 2025 01:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763084454; cv=none; b=GO3pdUZdw94JETVGb6uGMydNigmDEJ+S0+HuZesQW3SK+22/lgnCslwSv8e5dGy/n4Iw8TVP39qiGsI5dhNSxX8cII8CZndrCz9cU6bNkoBk3bS/MtZwsNVEWrrJB5e1mgleuyCPNdD52T+VZdZluveQk1Iv7eVs5308QcZ1ksY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763084454; c=relaxed/simple;
	bh=5xpl8iWRoH0reSd6z8qK9BZKfAmZLEkXgyvekMg76oQ=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ghChLduSk6xJn2LO+4p6MOgeF/MvvZU2AszJlpqLZ/UIq66JKFLboJ0eCt7UDUA+Hg80bpzYMeTFCcg4PliRYtjGAg+NdEqZ/3b/QpTuMqCyjjp7PV+q/F1fbk32hH+TH6ZkZiDEMuqTGrYNYwtM1sMiBfzjaq/47+Cpen5wcFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zHIzmtl3; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zHIzmtl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1763084448; bh=mvc/oHujhWVqbAHC40JwZAgzKzqEvFJmLmYT+tHmbpE=;
	h=From:To:Cc:Subject:Date;
	b=zHIzmtl3ceLEpIwrB0/P9mr2Y7BlDiAecW7NhLtK5TvuI6JpDMFxoW7otKU/s7sl/
	 2x5pCfDW7QpLG1o436zesfFZKiUKJvvIP6EGa3MqC29v7t1uegskksLV8PvJ4ccc+k
	 Ak/3MoYZfbpv7U0DY0TI2j/RmfXevfyW0hWdNq90=
Received: from cjz-VMware-Virtual-Platform ([110.176.100.172])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id A2D85A34; Fri, 14 Nov 2025 09:40:45 +0800
X-QQ-mid: xmsmtpt1763084445tz7w3xfr0
Message-ID: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>
X-QQ-XMAILINFO: OATpkVjS499u1fka4RtQ0YjveKs3Sx8uuk0nkkLNa6AUhMwIhD1fLJP+/z7z8B
	 FpdizdDzvIJ0BgxxcQAVMkFhWmi+Ekd+fDnwYQtXGvEIc1iG+jO/H0uknhTNRfcLfS12k6LxgtkR
	 +Q95PvHRkiC1eM2/ubqz4mpVPayaaYCC2//uELq48r4qGFuA4Gqsj7XvrC6a9+0MStlOjs2GQCaH
	 nAfu3McMIfTshq80cz8gTa2sULcuvr8JH1ReneG1qXmIdifuAUFSxxbH2Bx+iXcNSVu3YrLlcf6W
	 cRZHZCxo/jEEJjI6ivjd4tToCNr+s0aAYP+zGWovrmaznYMwKDa7s/IbqvMrcFXAOe8pQNxvrRbR
	 wNFgq2ezCrOeIdaods/iZ0u7OkCtXeU10uD9inkpHFnBqkiXIpGfOckK49hpyWq7YaFrfDcrlWdh
	 PhQ4rKJ0ikS1tE0hk/gUCIW+pIZouFSHgPiTAeII55WtjJSAsg2Gjk4Hg9usOI+XtP7fSHLoluEE
	 hOWleBbfUR6QhWGhACP92+YZ42+xPMIC0BFZM3nctKWz9NjlqTtbzTb2aEQ9THRKsq44JFfM9gTR
	 p557YTF+e56u7Yq6PnPelJzZP7Fu7UFWz7iBLxbB6+QYjNi1a6e4fepa3MK13VockaLL0m7jXPGd
	 zEu2hoeoXkjAnDoaUycdbl2pW+X8JDa1qoITOO2rDdVR1DoyEjZVwKIr9SK0xSuxa11BmxPOzvI2
	 bDYppa6VMAAxpPE02tGxGb7GfSc25uFmhEq/BQxYus086ydiQDCWD9IuMsBYdg2eOD1HiWfuI7xU
	 telqt+TS6YgCpMLtadPbeyX0wQXFM1j91BlYz8EGAoQPhfi/2UOnNmG5T842cOsUb9d3C4IZuHaq
	 djPIWbzwSc8GloZahNLgfR5RY3CK/kOgNcyPlbZ/+/bBVjBVgfv/q9XkxaMTp5iXTODz2q77l3uw
	 1qLMGfRU8lLrK2n0UuOK/abXTc+Nsob6y3tHf/kb1k0uZ67OrqoSrMcGfQxj2JQGfwit64R2w=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Chang Junzheng <guagua210311@qq.com>
To: outreachy@lists.linux.dev
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guagua210311@qq.com,
	Chang Junzheng <guagua210311@outlook.com>
Subject: [PATCH v2] staging: greybus: audio_manager_module: make envp array static const
Date: Fri, 14 Nov 2025 09:40:43 +0800
X-OQ-MSGID: <20251114014044.4343-1-guagua210311@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chang Junzheng <guagua210311@outlook.com>

Fix checkpatch.pl warning by changing envp array declaration to
static const char * const. This improves code safety and follows
kernel coding style recommendations.

Signed-off-by: Chang Junzheng <guagua210311@qq.com>
---
Changes in v2:
- Restored original indentation of array elements
- Only changed the array declaration as originally intended

 drivers/staging/greybus/audio_manager_module.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..78013d59fc93 100644
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
+	name_string,
+	vid_string,
+	pid_string,
+	intf_id_string,
+	ip_devices_string,
+	op_devices_string,
+	NULL
 	};
 
 	snprintf(name_string, 128, "NAME=%s", module->desc.name);
-- 
2.43.0

