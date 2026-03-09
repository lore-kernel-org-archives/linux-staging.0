Received: from ha.d.sender-sib.com (ha.d.sender-sib.com [77.32.148.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394ED3BED40
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060676; cv=none; b=IKhOlD0jtPdeDpo1fGlH+tumDudZJ/3rQYxqPlEXV3ncCe5J9weEa7JuxxS8MUwJBPDxzgqXtxNkJItj6AdwN77UFdbd+jHtL6x4lIuHrqNF6h0gOJ/rUvWEP9rsOY9vrxa8m6WPl9WvF6TLgUCrRAVmj08juH82YscmcdvhAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060676; c=relaxed/simple;
	bh=gicbjNmULgWgtjkMqYvGugyhtfQNb2a3goNKc7npwNc=;
	h=Subject:Message-Id:From:To:Date:Mime-Version:Cc; b=VvtEZDT2089AJMfPiMK+6miAuXO6eRelgMt1QFEj77oQnggV7So8VdCjjG7a3Ncpd7kj1euAM5WwLrEM0w6iRHw3+na9O2JsRQe7ZMtmH2dqfLf3/iOT6ovvrvqDZk/8rXzCEEZPrmaZV+zKuKEOrwbs0GJK+MHSrG2oTUmYdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=ha.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=NvX6FUIn; arc=none smtp.client-ip=77.32.148.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ha.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="NvX6FUIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=gicbjNmULgWgtjkMqYvGugyhtfQNb2a3goNKc7npwNc=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=NvX6FUInLsPbWYT20otcOoYaRpmhSRn+FHWHIqx5btrRNaauMdZgyVhJIk6PIdr0G0PjFFubLLA4
        EMKEbz7Ah/aEDiGkmv4xT+E5pCVC2FS6Pg1j4YuiH1zn36jJYEd9jvYiN5ErNZtxSsmazfPLtfmh
        NBmvjzDe2O0ZxARj+m41gKUHKeQvqPm+3fkGzO08u4fMly+mhMlfZsint47h5t44lFppRym1/Fqv
        IMrlgHU0SP1mNIiIqkmv0ZDMAI7KkHFeXQlyGflCmTYWq1Eqou4zRgKnJ7YRSJit0Po8vKpNbA9z
        kfrSDXmslKg0fcXmK1fRzLmCXWb9v4mOCpp4Lw==
Subject: Re: [PATCH] staging: rtl8723bs: replace comparison to false with logical NOT
Message-Id: <340a8617-2e82-4302-bb91-66406474eea3@smtp-relay.sendinblue.com>
From: "Dipesh Chaudhary" <me@dipeshchaudhary.in>
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTEyNTEwMi4yOTg2NzQtMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2BfmhhLmQuc2VuZGVyLXNpYi5jb20%3D
To: <dan.carpenter@linaro.org>
Date: Mon,  9 Mar 2026 12:51:02 +0000
X-sib-id: sx6BTvvah7Rqw9zKZ9ELYq_V4W9NVvqYbI1BlAyFyBts_YVJkQUaT42ARhoADBzDSA7cZi7Ur8OhlxZHrj4ZkJE2ScMiS5MGQbT6Zmj1yZxKb21uHGCtKwCEUG59zqfy3xUE5QLo963NpIBykUNpsOoQYc4TWqWR_aLA7UcNHicYZNYGpFMHvD-HqwA
Origin-messageId: <20260309125102.298674-1-me@dipeshchaudhary.in>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.27:10551297_-1:10551297:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.3
Cc: <gregkh@linuxfoundation.org>, <trohan2000@gmail.com>, <s9430939@naver.com>, <ethantidmore06@gmail.com>, <davidzalman.101@gmail.com>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>


Hi Dan,

Thank you for the review and the guidance. I have updated my Git configurat=
ion to properly capitalize my name for the Signed-off-by tag, and I will ma=
ke sure to run checkpatch on the generated `.patch` files going forward.

I just added the staging tree as a remote and switched to `staging-next` to=
 ensure I'm working against the latest codebase. I appreciate your patience=
 with a newcomer!

Best regards,
Dipesh Chaudhary


