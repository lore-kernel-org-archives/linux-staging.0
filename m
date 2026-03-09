Received: from ha.d.sender-sib.com (ha.d.sender-sib.com [77.32.148.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4438E5F1
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053460; cv=none; b=ZVH8k7Be0jKciZCQ3va0Jnh+UAO7/HK3hFLAyADs76pVEsikIm/kBZXV2OwnMjklFKypnGcD1R1MAsJxqPSKFon8anrLd6z1AkLY/MDtUjSeN+kOLIS4FZ5Q+fXoakelFIAFUIkxVdYoEFXllG3YZvqNU/3fFDbmhKR1oDOnMAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053460; c=relaxed/simple;
	bh=1mkGQ6BM41dlgBK2ADTUfz+Vi9es+rIjmaHL6lqeaQs=;
	h=To:Date:Subject:Message-Id:From:Cc:Mime-Version; b=J0/2kzE2RNSsqQEENti+Axl+qFjenOR2t7dmRxIz44/ZfaLeRh3uZJQeoNBI7XjVvPWD+VanLak2/6FcMqZfm5V4g3bKsr1mG2+EDm3dPvM6l7NuoE85NoHyOpNg7MpryGV/cAZnbKQCHk/1YaCOL103hXE2vvcrgd8VnQW3O9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=ha.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=EgWSrlXQ; arc=none smtp.client-ip=77.32.148.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ha.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="EgWSrlXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=1mkGQ6BM41dlgBK2ADTUfz+Vi9es+rIjmaHL6lqeaQs=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=EgWSrlXQQFabkmDqxowuvJh0M/5t9tMyi0SsGsKNyyxV7KpXUVfqXsP6218lyONLHJda0r1LK+dl
        21SCHlksd5/q8Es3aGDzCoww6ZTn8NEN5oiTCkyOOQBuiotgzI3mbiWyfpq74Pa8BBvoW/Lvbh9X
        JriVXWT4n7K6pomNd0b64ik3SylwkUekyvV54CDVv0jQg2/Fkk8/p80J7Ht1EpjW4owQDHByiOJs
        iLIAyJUoRZ3TSr31Gr9r8urKt7axWvIU0KeqYhvM64S7tIpI4TUuY0cW+dqqWYvNqxlI1kdP4sM5
        lQ+Uuu1xUa0nXrVc+7O+soOqetOS4YhdpkJxRw==
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTEwNTA0Ny4yOTQzODMtMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2BfmhhLmQuc2VuZGVyLXNpYi5jb20%3D
To: <gregkh@linuxfoundation.org>
Date: Mon,  9 Mar 2026 10:50:47 +0000
Subject: Re: [PATCH] staging: sm750fb: constify g_fbmode array
Message-Id: <c906c51b-e642-4d0c-a840-5fda05d3c744@smtp-relay.sendinblue.com>
Origin-messageId: <20260309105047.294383-1-me@dipeshchaudhary.in>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.27:10551297_-1:10551297:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
X-sib-id: vWEDuy_BovYmoeb2SOo1pS3frIPd2B4olESNxulZZ0cLlL09sDzrlLcXDKo6HuAsS9GW_vjp7e7Ww-dy-lN24F3FH3I76V97zbioERf7fBH7Id9aO39yP_3-GSSihQOyABUFA5tnjjI6vcPSzU2T17C-yEJiKFfLt7K0gxDYzo0B0k-1OH2bIxJcIsQ
From: "dipesh chaudhary" <me@dipeshchaudhary.in>
Cc: <trohan2000@gmail.com>, <s9430939@naver.com>, <dan.carpenter@linaro.org>, <ethantidmore06@gmail.com>, <davidzalman.101@gmail.com>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0


Hi everyone,

Please disregard this specific sm750fb patch. I accidentally used `*.patch`=
 with git send-email, which grabbed an old, dropped patch from my working d=
irectory and sent it to the wrong maintainers.

The first patch in this thread (staging: rtl8723bs: replace comparison to f=
alse with logical NOT) is intentional and was compiled and tested. I sincer=
ely apologize for the mailing list noise!

Best regards,
Dipesh Chaudhary


