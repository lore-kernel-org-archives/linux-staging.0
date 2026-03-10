Received: from sonic310-11.consmr.mail.ir2.yahoo.com (sonic310-11.consmr.mail.ir2.yahoo.com [77.238.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B356B39DBFB
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179372; cv=none; b=ku/+09/cpz4nW7oxz7ZkwtEq0J9u59UKyrDHlL2ZtdQ8BGVf0LGDHFtvWYSjlEPAs0WZlV4xP6Q/c52Bmdj8EW/1gEsNO+PPfZXlbsirWP/ovqdSQe5cWLwrqXsBxZ7A+HdqBPUIzCc5dEx/DkTMhJJ4BoBZ4P77hMBTR4Vg5mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179372; c=relaxed/simple;
	bh=JBcQNqXbiFhPwJCtic7fUUTLp7DIa5Ua5LjNKFKobKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kB7FWWc8UQDcURidUnDKf43k0u15U8YASwcJsKL6FHk9m5dGGnM3hvzOGyZDLtVfo89OXMM66fgFknFZ4Uz0h9xxvvV2+a82IIGa0UWxEZQBcoNlFCOQ7UlbE0QIcIx19GlSrIqKR/sSi655avoc3Bl+I1ML5FaCoGmrJWVjKEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=D+C3SJxp; arc=none smtp.client-ip=77.238.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="D+C3SJxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773179367; bh=aearU3IfMr8JowATbRtdU71meIMxzkiL51qBeIbhKxw=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=D+C3SJxprmHmDEdN7F7bZDft0WA0mlu4PR65oFuhI8o6KuRihtDaAaw9zdcouVy2awtbB8walgxcNQuf1GIHBO3SjpG9viqxiUVuJbl6/qHjzG9bCAkrxZJ1t0Thc5drkNZoLMMZIJdIx2mQKsoNp0rV0qydK74Ixki/aUGOLY748T5TbYJNjiZX7Y8t11PJl3PP2U+XM3lirIP77XnI0xGEghiEL+1/7QcBUbHNZd/zYBi7L/ifQP7kg48Em4S4Ko23/T2dFzzbgOZ326A1lL2VEWM2+Fo7BQCUG5GZUrd7ysAIECGJ/4KGufjbISRtOMnarNGPr+OHfQAi3DCnZw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773179367; bh=Z4TifSPaIWuQBGSjb/uxPpFx7lW/EuS1KI/Itti1YvO=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=ip6gf9FnZD+bMR1XCy43VsEhNC23+r3cS0xdyuvROAh1fN4d8VRo57tOZkAlrH23nIJedC2krLzwxBDQ/td2DZ509npSOUCiTlWr94wurC0m+optG1EN0E7u7jOpf8qKPvOWXmdK7deGIfeFJxP7UdLTqRsvvNbAzAqws5pUaOMZfTUGTqxo+w+xD90XP4JJ+HnW6BNBhFa8W3enyiftjXi/sqzF7RdvAXtqrxIJfy4Zij2FihksypDoXW9Z1flK7MnQMYnQMq8D741R/4c04aaGPny9OZOoSP6eg7BDdf85DU/FKrim2uTT31SaKhV0n7HWon33igHXqI4Ya2JxVw==
X-YMail-OSG: EHNXloMVM1lnoOqQJ7G9Nn0QcdML7Vjsay0dvEojWfkw38XrZVFVK2JFHPYE2Z4
 loaFdNZBbGOwh0Z6R4DDWFoev9kQ.WojkyXSwgPIQOI69ONIBqy6h7GuVUMKZIAnwYijXokEFqtk
 ByiQid5JmNpl29S9ft201Rm6WsSpanK1savmWkJArIjyf0Wt1ffWtfU21Bw9JjwO3fpfiJgjt3L1
 EZOsG7MVLnSvjQt8y8FxPSn7Rfl3HmsL28VZRNo17fu44mcDfUtvpFsnKm9nXW5cT_qCu8lqBegu
 pN_WlpfvLav9PjEP70grfFGPQoOAMURrsPZlNbk_eKY_GjDMHLP1RZoyGFMWApNfXVM4MZFYl2ij
 Ng4.tNnV6TNwgZcD8rWQcRYsPNCn8VORgPld3IFYYWdXcfym5eQLQLbPFmOSQYaGZnPcBnWwXkBT
 IqwGHPVJaRwCqdv5Pink0Ww7.zAmRYxRFTZLGiysR5pFj7chf0yNgGj9gwmvTqT3IxUlz1FRYV64
 SUFvNtUWsiPgdwEf_buN4IhnrJ8O4PYP5iZRJfOclJ687CgFS6YTk_7FG02gFgn3qFAkmo9TjcAj
 zisv_4AgPP9EbgyKZ8IvR71lReghG5e8GJscp5ra4fkPSS7W6Z_xHa1xNuZFEpGBkwMlJs62kEm8
 M1wuXMVIJR1biEw03KhwmUd_agKt3NXxLVd8_trt_eFZzIQwHfYIdIW_1hl7OHNr67tsHFwyMNvX
 bxSmlqgyMC6GkLLVWR5DYtP5qT46OSv_2dyZhmhoso4tp48ygJMZfoVO2Te2k1i2T7E7Hmm6z702
 jUT44vfHi4EZHeF.zUbIScD4qPhoVDgQRqHkOkqyXPsn1zNY28c3sn7kcPFvajZgzpC1S8qJkZ1t
 GRN7lJLt4j3PsLspTY6dzx4Q8z5uSNZeIcuPLCtj3G8JPDxEwSewI4l.AHuNrW9jMsWjAhxWI54l
 2agzxvaIWeQRHPstJIUJKI1HUor6JUD.QhmsHn9AZrcAosn.6.6CRkN71I6Pxx07l0ZQ8QwlZNkU
 KfOKaW9ckx2uF6i94kOo6cqBpymHYpI1TmORfCNbYfEM1_PmQck1FYsc8NDJSBzQp2HXhHt0ZjBj
 BHOd4RW5gcKlUqbEU7pmLss5NxP8vkknF6w39K80w3vJqT9iv89cko7sG069LEwFmQLijsNJxtRU
 p9T2bYyl7cNepl3i63xCNKhK5QfGFBWeSjQ9n2P9jDWcXODxoZA89KR3Le.DqyN3V5Qw6OaFuSjO
 vGI00SzlRJp6ivcS2uYK96u1kS8z16h4v4pRBcBi3Js6YZ_5D.k9ptDei_aFoJvYl_iHDG0H05aj
 i7zUnq9ar3JsTRiMykgfrb3FbRtfTeX7dAlDH0MVSNnrSOdDuPJF6zUuGFyq7tcMLmHbO9oJ.bMN
 MqanYeiOrHF.CC_Q9U8BAMzSBN6URBmEteUpf79Kot6hLnqwhPgxlTaYgdqLxrVv_2C.tZ3QN2I4
 4oV.wPi7BzBsDujfqRZ8V7w6COoxQb7iYWItYHaoDVbP1We4GeKKqZcMsyex1NfuB.sCcxEuzsEi
 DRjBoNOnuf7E7_bDLa9JjRRP7o78CsEj6n2rotaSw3VjHb0z1E2Ni_guO2n_v1ONrKw1Navbuee_
 MXu0C4UJWmIhbi_PFrCdCZaqWQ0Uremf_Bnmm.b73KCn0ciLdIAM_XccsgrKbNdkUe4WDfp7qfeC
 tVDbAwArvPruOQbyRqQ841KaB27PJv63auGA4ArB2Z_PkwoRYYyNX2MRUlsfROQ85p0AhM_NaHB7
 LOHfMB8DN6weyb4GyQ8zSDcLKmZ6lUzwtZ9zCBpu1vAxIKY6WtAhSWQjrIvW7uy6g9syzsTwROla
 X03TkBxreY4MauPgk4mT2LZklYAI_Ng1vY9KJVmwa9rCbZlDHqUlfKScWw0j3L5l7gIsLTe7UApX
 6g_q_PYj5ZenFzm1WZlC_cIcJxkrpE46IwRKZaho7idhR6lD2740qC6NLJ3UKLjkMCJmB6cmzm5B
 7Z8gzKVXtOUSE6IaQwpUZlRY6hoZU729CuTkquSVIKxDqq3HPmnpBTGoGWtDp7ZqkfW_9pvC3nu8
 Dz.9tFXVYvHLQnm0UUrUs7aMZjD7WwyhOHF7IAEn3VYPz4BnWCs8tHUzmRaUckDLQ_8.5Y47uHun
 nXQsn3HicfJEuGuLB62ChsdJWH0Q2Q0g_Leg7vR2jtxuEmd88_0KjU_w91262KYbbY5wDCTziJgg
 ONChXtochbtsDCTh27AEhbagGnWbsaPAg1ftUybamkyGM080SeAVdz207mRrFz_Jb7Gy6XSmLYJP
 5mdBpPqhR9Rqzxp2wjg--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 65d8f26d-32ed-46d0-886a-8168c3c9ff76
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 21:49:27 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 95c3151d01371ab1269f6f8bbf003118;
          Tue, 10 Mar 2026 21:39:16 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Mar 2026 22:39:12 +0100
Subject: [PATCH v3 01/28] media: staging: atomisp: Remove unnecessary
 return statement in void function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-atomisp-remove-void-return-v2b-v3-1-3fdddab41271@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3

Remove redundant 'return;' at the end of void function
ia_css_dvs_statistics_get(). There are other similar occurrences
in the driver that will be addressed in follow-up patches.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de2df..3d2cb2d25fdb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -269,5 +269,4 @@ ia_css_dvs_statistics_get(enum dvs_statistics_type type,
 		ia_css_get_dvs2_statistics(host_stats->p_dvs2_statistics_host,
 					   isp_stats->p_dvs_statistics_isp);
 	}
-	return;
 }

-- 
2.53.0

