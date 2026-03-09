Received: from ha.d.sender-sib.com (ha.d.sender-sib.com [77.32.148.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825938BF85
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051217; cv=none; b=GZdCZKGXm1bvEePbq6ZyhCP0Bk2nCN5tERTom1NHRjEfabBLzf532IzQk6ACypAlQBOU7cT88AuECnLBldAEUFWmxFa0LaNY5spb3iwMYUj2roU7KAJuYKNrIoFZFkhg+hJdW+90zHYRSEu6PkFyBBjtfP/6XKi+RhuJWiVVIJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051217; c=relaxed/simple;
	bh=leV9CnIFeoOPZI1o/0bHtXTdNX8/o6qWmLDRA8ywHug=;
	h=From:To:Subject:Message-Id:Date:Cc:Mime-Version; b=Yey+4lvt2etP/QZOOYVtEeja/fCGV6E6A1EqLLPmeN/cTrkMokDEQLxgWUqeY+xEf+faxr7aEsB5YiC+QhWrTqBV3bGyQnopPdnSrkRyzJsZCutTD/Aw5P9f1MQ8ELSUAdCPiuSQKj7VYXLMq/CGagUchFB2QT5OWb8u3mmIwI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=ha.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=N/adrX7R; arc=none smtp.client-ip=77.32.148.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ha.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="N/adrX7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=leV9CnIFeoOPZI1o/0bHtXTdNX8/o6qWmLDRA8ywHug=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=N/adrX7Rz1qZlZ8fJiYVHeUcYmXfsl0EjSM4+61KvEhAtu3qZcgiypfxX9ysL4QmAAfvDTrwECxY
        DrVdYq3IQvbsgoUmTe11K4hQh8caAykYHeA4JNwNJ6lDOBmVqEhXwCzU2PUedauEePMC65fzv+Qp
        OUANO7R+6WZZqTRkbGUQQ52zlALWcZ/eHcPYNp3bYqTjC+HPW0yImcPJdUzHKD1iQeL+nNHaYF6e
        GriTtJosNfBIymrpcnu7qvCUPlMR5/Sl7V6bPyJL3egsp/cTYnn86mnHMlom3D+3vKjcZqOxZ3Gt
        fl2f/1omqUUiFSdIzkgjp/PsujlrKJyg/n+x9w==
From: "dipesh chaudhary" <me@dipeshchaudhary.in>
To: <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: sm750fb: constify g_fbmode array
X-sib-id: NA0Mt3pJm_VjOKWnRePhjTaZS2_0qA-1Nt3GzwHIvbWTLckciwczlqOaKR_lzi279TyjgBYy-mGYzZqSRtVG9P1XjNc_JJ1EeIQizemWYDi_J4CwEa-wrhTB9zvH_7LQIUkNWpLMkejVCB-cizNZuy4G0amYL0IqYTNbZAJgOQBfxG1wA2ZOdDeasMM
Message-Id: <7fd06f3d-69cf-40fc-b798-995d64d0cf57@smtp-relay.sendinblue.com>
Origin-messageId: <20260309101311.281366-1-me@dipeshchaudhary.in>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.27:10551297_-1:10551297:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTEwMTMxMS4yODEzNjYtMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2BfmhhLmQuc2VuZGVyLXNpYi5jb20%3D
Date: Mon,  9 Mar 2026 10:13:11 +0000
Cc: <sudipm.mukherjee@gmail.com>, <teddy.wang@siliconmotion.com>, <linux-fbdev@vger.kernel.org>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi Greg,

You were absolutely right. I just set up my local build environment and ran=
 `make drivers/staging/sm750fb/sm750.o`, and it immediately threw `error: a=
ssignment of read-only location`.

I fell into the classic checkpatch trap. I blindly applied the `const` sugg=
estion without checking the surrounding code, failing to realize the driver=
 dynamically writes to `g_fbmode` during runtime in `sm750fb_setup` and `ly=
nxfb_set_fbinfo`.=20

Thank you for pushing me to test-build. I will drop this patch entirely, as=
 the checkpatch warning is a false positive here. I have learned a valuable=
 lesson about not trusting static analysis scripts over actually reading th=
e C code and compiling it.

Best regards,
Dipesh Chaudhary


