Received: from ha.d.sender-sib.com (ha.d.sender-sib.com [77.32.148.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC1E38BF64
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050791; cv=none; b=c1qfHnEutAmWTND33JB92OCTdu7G4HkRR9R+pznhE/4pSuNDI4wb9CbZtcSKI6ysGSgvAgKm9MmMi8XtxmoaSaNJbd0eBIqBqh8IvZ5x0QiWfZNjqn4nqaFm3l4Oyd6XdyAtyNu2/1n6GVWmK2zXXhIV4Y3bDPcibe3KnEw7SXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050791; c=relaxed/simple;
	bh=uQ2kDxpdlDDv6iF7b7NG15zLxeKxpKXzs8NjvMYST8E=;
	h=From:To:Date:Subject:Message-Id:Cc:Mime-Version; b=FIhkAZsvLoJJZ9f84OpjlAh6qgAdcnTIjLWwhpfNBibZz1sA/DUmY/JfAIl1LnByque/zqOHHiX2MlFC43M1Znvn0OzKiR7H6K81ibMjfy/4tvpSU6HYuBvzeWsI/vjF4FPuDnqfc36JsbTd+eQ3xqCn52HA/JIM33ZQse4fVCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=ha.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=f+GnYnyd; arc=none smtp.client-ip=77.32.148.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ha.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="f+GnYnyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=eAxF+/AcK7m302S1o8AvFUXytSDJKZCmIk/jMtwP/gc=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=f+GnYnydEloOCezvfJyv8gJrttQ+G/b0lTtRiTMeuiGRobQKpS4LjauEQfYM39lLt5OCXcXJ4C4V
        C4uLUB6EMDHJlU/be2c3Hp6DOqLu1Ku+lt5jSca83CieTQ1e/FkNeBaSg4PK9iYB+ElIKl5jXtp0
        2EhVuJ6gRFaeBTIAfCJXZYe5t6dM3qpclz+KcayYo2KLFmseb0aSi1g2D5c/QlH2OdqB0x+K8XdC
        hTxqXN6txNSqxP9qoT+v3t0fnnSpWFaZLOVHkjD/ldbCPp72MZNqX0n45zPEPH99Bg1LyspmcTT0
        ZKoq8VYDE097n+uwHiucSy/Hwp0MYpW6TYBrQg==
Feedback-ID: 77.32.148.27:10551297_-1:10551297:Sendinblue
From: "dipesh chaudhary" <me@dipeshchaudhary.in>
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTEwMDYwOS4yNzg2NzctMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2BfmhhLmQuc2VuZGVyLXNpYi5jb20%3D
To: <gregkh@linuxfoundation.org>
Date: Mon,  9 Mar 2026 10:06:09 +0000
Subject: Re: [PATCH] staging: sm750fb: constify g_fbmode array
X-sib-id: mHZOtfTt3jW-zOsU6hgM34Pn1ejKlKogsDWHpcZjRiyqCJzROlLBpkCE8kYpubo9YPoTiTagyRWuH0wU2hIH-EV8ECTxP55H3pIpUNk3GaGAtIp0fpgFyUgEec_wtTlbGgbupgC_jwuZ1-_shNFlE7SDt_kzZzvaf8VwwhsAYdGTJLNkB_azVYSVOUM
Message-Id: <32f062c4-66b0-4323-b0ea-fb554dcb052b@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Origin-messageId: <20260309100609.278677-1-me@dipeshchaudhary.in>
X-Mailer: git-send-email 2.47.3
Cc: <sudipm.mukherjee@gmail.com>, <teddy.wang@siliconmotion.com>, <linux-fbdev@vger.kernel.org>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi Greg,

On Mon, Mar 09, 2026 at 09:49:57AM +0000, dipesh chaudhary wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> -VERSION =3D 6
> -PATCHLEVEL =3D 19
> +VERSION =3D 7
> +PATCHLEVEL =3D 0
>  SUBLEVEL =3D 0
> -EXTRAVERSION =3D
> +EXTRAVERSION =3D -rc1

> Why have you changed the Makefile?

I sincerely apologize for that. This is my very first kernel patch, and I w=
as experimenting with the Makefile earlier on my local machine. I accidenta=
lly staged and included it in my commit alongside the driver fix without re=
alizing it.

> And did you test-build your change?

To be completely honest, no. I only ran `checkpatch.pl` to verify the warni=
ng was resolved.=20

I will clean up my Git tree, figure out how to test-build the specific sm75=
0 module locally, and then submit a clean v2 patch. Thank you for your pati=
ence with a beginner.

Best regards,
Dipesh Chaudhary


