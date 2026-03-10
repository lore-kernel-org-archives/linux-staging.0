Received: from sonic313-21.consmr.mail.ir2.yahoo.com (sonic313-21.consmr.mail.ir2.yahoo.com [77.238.179.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07983F20E5
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 22:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180750; cv=none; b=Re6EzSKq+PIP+FeVb9SasyqLtqAwGzi5CMjON9skWobFMYKSqUYib0ago0Q6PImsjsT/jVq6HyNQ25UCb8kFEPADqZeibetY/TezZHe4bVKk89oTK+l/w4vlY9FuwuTAMGMeUjJdTB87YHe6NdekF6yM+hoI/uqj14gdkcHHqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180750; c=relaxed/simple;
	bh=562QI4ZPQcQnDb1IyQQCtia8yHftPXKn2EKJLoEDtUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRK+BXjgvj8/fOLjTHQDV0ybFrTVYYMR4uGP9IRmIGWS2YPqMIU/0BliInq5NiiWYTorp5DKGeyfIGpOAXdorwu+/+V1J29JduY0XqJAmZfhb4iUhz1JfkjrTDwNHbuYZQvxpeOyYG3fr1vaMDO1xF3aZvQSTarAckf2I1n8qRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Vbye7qb8; arc=none smtp.client-ip=77.238.179.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Vbye7qb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773180747; bh=oPuwWtAjE8l1gxxo0VMKLBMfFuQkQY0dOC+jUkobLcw=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Vbye7qb8kaugfonTG2ZYngOp1fY7J+GPML9wEJ/xAAd6RGvRrBInLEaQbwcW/Nm2uB+POwc1offmmWXHNhGKUv9f3DB42yOuWDfQUlWfFPrgbxpyF5pGlgvmT0MFaLtFtJcVBk636h1BJGui4PD5qGWLo8vtHzJ4YLPp0e1fbGxedGgRrN3L9D+qkuMksL8FryMYHatrOcvv3D6oGdI9Y+72GPFWcyl/j2jG5lAa07slI4mMc1+OG2NUQk31hLjOXUPmaAHWdaf8wHgsw4SoHxiVa91G33s5HIc6Tq8A703HIj17kKxDJEiRI6X+mF47hlAUgDuPwpS9upVCdjJrwg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773180747; bh=04Qp9AvY89+ITf4imBIizAtae7J8rvkGrAPSct8VmVQ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Td1T2kfn9TXA4j8U6Nz9T2RMDNcHos+XUmj5Bku1rhDi8saRlWAqutAvXDOCBqtE/9zsGh96HdnAtX81eP5pE5gi+ZYmKjMcNk4ZXaM+Bughk8lCPH33gn6eq8PDbmMbYhvcixeZMt2/39n39AJOUOyDCrczU06sHgVqnRjZXgs2mU4Qh2LAo6X4S+0DtIscnhu73DE+NXR+eeDVyiPhdPGzLZxzHcbNQcLqOLXygim6VKCG+h2xM8TNS2axY+vSoKgxiQgCQl3Ge6Ygm+J2whywAi8VSyFzR9Cak+jpsqqVxiT1NzONaYFuxwHt3oCPdDRLwWwr0L/LQNLRz/DyUQ==
X-YMail-OSG: 7H2ddGwVM1mCJnJi0glW9WCuHRwrEaUUrj99kmr3aOhdh27A2bC2sft6gEMfccX
 P2tCPF3snio1eyuYAJ3lh2Ze8xsRDTX.UqewuebpwH7jaN9Ia3FpeGzVmorYtATcMhUTxLv2Ytea
 vD6YOqTzillYOt3aHUiZJA845on6B9SFRo7kutb0GbJZPQ0J1FDFvQ1SwnSE95SSOPAyV5NtDrp0
 94PBCmHApZOBSS5as31a2g6scfOm2c9PwS9V2d8Ep1sG3RzpP6CwGE3BHBP4A1setA0BtMr9rCeH
 m9Vjs4Ky9N0cO.JHC5YyYTKGkTVPajo_uSUDwMfkK3w_nVVB.czJUw2hth8DMyQyJ6PRMF5fARu3
 3V2woXxYeenk9NJPV.fvF6qgIoc.kOUEaONwRmFMGBuSLfqnj9etbcQhNW2EJTSvDslDYoedCBuQ
 oRLzQAUaTg1wRrohLfDKAs109yVoTE2i5qBJ8bJ_5gg6wCyw0LtwQ7HQ3r1lr5LBqPfqbC3.USTg
 jHruLOcDes1DCfPH3yUMOeRzxErNY6H_as2r7_O5UXfomxSER0DWeoL11mvwS52rQhpxbBMygwdZ
 grTxRXcmOuvWrGr2tBE35eJnosVWuxqFi_2SCiFh2FMjXgst67FZKcI5SdJX999aYarBZWejugOH
 uwZ9LpRKuvWmy0k8w37xt49wQlJQg.sco7pvQ.g1qr658EaFZ7UGEy38ymzY_mgoAcQpbDO_uUrP
 lqzjnmwG0PrZ1PYEgHe1EhioT2S3e.1ZlzJXvZXqrH5vxqofkYdXnTu9f.24i49vSdN1x0EWwGtH
 99NHT2dVZLVDsQ_tJ7Sx.mweRwgtyx6lCpp_ig0pK8NWMfa4to7zaCaKe6lpjfGE79DlUK8R9v4R
 KTkHfjZQRMYE7fxOPc1mbu1QqefxVTf1i0e_ueJ3arnjeogcMWaLk6kYUADo5WlO74TcADGBO5Yw
 _nla617gagcDILlc3Z41BIPCX.7K5gtsuw2_G1w7K.ccSktidJ5VBiHUdcse489ftUhHbj7G0ngk
 KZaG_3L1PPea8keWef6YfPi3Q7ymaoqoVfO2qPUxXUgPWtQD2JnyF5sf.yvBhv1Eadb3FgpEz_c.
 zt3h1zFakriI75WRgO4Aw4lq6zhbVGHEB2_tytNO7APs_g_BzYuyTshDBFJeP6r3rnVlFIQ7UAUV
 UqS0OKvNF7OwfSv0YKV1ozqoKK0AANW98I3mGcC3hA.89Rt_rSiRsqCA08JihipnLA_Qa3fYXPED
 xZLvteQUOjLGzivJARkogcUHhIFbxCAJXN4iIq488yzyDJVszTO8Eb5n.QDrPmrrupVj68NT9FoE
 iZuljWxwPVTsOIfwNHAER2XtT5U.Y85BmQRjMcXjnDaMbj8wAQzCgV_lZ4zO6J1Vu0eB6lXnkbr2
 F2SJov5FYSrdn1Fx16HatX7E4AsuaYH.gK6L_k7GmhGmu893.53cSHRvZ2RSVry5Vx4WldeUMeuu
 DsMXGvNZ_Uu4.aJQyYoBk_3hOuuQJKge4y54fJ1sShPZFPshm6mS3SX8uGxF2WsCFucQ1rLNkxj0
 VKcs5ue9uGlg55bov9tMwtnt9wYoP4kqzxyKOdGmggArnFMMyY38ndI1_VR.HZn9x0vNKJnIeFP3
 1GjsinNuqMTcJuH8bSd8anV6FJS4cAdZP0VC88BA6UEq.ZamY0lYkjldspTKiMDNIWOgc2vK.fB6
 2NT1I88Z_QB6gFOVotnB7WKSZp0bPfI23CluXnQLTA8C47WS3_npRr3CTtuaSY.CiIkdoYPLTe59
 DQpmeffWcPryjOZUxodJK2tVpSK5Zvph6dlRUhfC47J5RyFDcbU9vgrnGo3iqa8GrfuoRKnETqgZ
 hjbce3NZp0C0TVYpa01uTsHl5RAVC4F1W8L5AUJBLdlMigaIPVKoyiSnfDRlbPxcabi3fSUNLA1Z
 f.hJCxM1zLpXcYEztUAVhN6EMcT62zCtJa6Eb48jazlyV.0j2hx0q0e26AX8EGAGUQacm2j4QTu5
 Ks2zooUc1p4X1oxdGGkICo_igFTLZUoX73O0rwm83pXmVuGwXRrDyDh3mCI4lletNTdKVh9Dmlzg
 CtaDvTUZUlNP_zpUlCKI_4juHcvkBW.zjwGIUYk.T2l_G23I4BfKtgeTDDDo8RP_G3N1zCi0y.7y
 7ml03Hd5tKiDv3hephA2VIho8mNsUtmitLnEGBkeeFa080cp5bZ65lRemM6sDscmtM2g04PBhD7.
 r8gLJvokGDaNOs9l5NXqWIDjUi7GEXQlAh.D8fSpSv5JuBuQ9rU.Bkk_2sYhuUtyPG4U3d6JNBP7
 GSh1IqmyrowLgk6cnrOBeZCzI0mEx
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: cdd507df-654d-4135-a794-cfef82c2782c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:12:27 +0000
Received: by hermes--production-ir2-bbcfb4457-4sf65 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 48b5c4a15ee0780b19eed7b75aa629cc;
          Tue, 10 Mar 2026 22:12:25 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 03/28] media: staging: atomisp: Remove unnecessary return statement in bufq.c
Date: Tue, 10 Mar 2026 23:09:47 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-3-f2977db216cc@yahoo.pl>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Remove redundant 'return;' statement at the end of void function
map_buffer_type_to_queue_id(). Void functions do not need an explicit
return statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index 0f0d16f4ce7c..51f7c9d6f378 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -176,7 +176,6 @@ static void map_buffer_type_to_queue_id(
 	}
 
 	assert(i != SH_CSS_MAX_NUM_QUEUES);
-	return;
 }
 
 static void unmap_buffer_type_to_queue_id(

-- 
2.53.0

