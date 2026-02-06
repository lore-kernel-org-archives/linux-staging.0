Received: from sonic313-20.consmr.mail.sg3.yahoo.com (sonic313-20.consmr.mail.sg3.yahoo.com [106.10.240.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56AB1E2858
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 00:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770337727; cv=none; b=gldfMpn7Fc3357HO8FRxxhGkkWDtJNEYJ4WXvsz06t1SjBVBaikvVewTGRv+sTIJ/QPEOTgesj79fgcQF8WXV7/T3u67eQT1H8H2dcjOUmbFyXYmIfki/quzYDagHB6CIlL3p/9NwuAd25vT011Dre02h0fvBMn8zlaHjtHQQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770337727; c=relaxed/simple;
	bh=1UXa3zGwQZnAU91uLADfj+ikOpZDMyk2qiR9BBPVeHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=WwGD/fJmOmrd82zEBRudQUJgBgWYTyM7l5ICTst1G8mqfePkPMb+FnpdzGa8u/AXST66n9dBoCbQmJaz6KfVVeE0Z+08fRxsWCmOJAeutj3Tr9pB0hYLj0b/qMC05eWtg29e/TM8dumcIOCmeUh9Ho904k+USohV4upbAXN8WcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=VCjescHy; arc=none smtp.client-ip=106.10.240.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="VCjescHy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1770337724; bh=UGABlUDGaxO/uCUl9wsLGEU+fWYcQHD38lbFCXcNCmc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=VCjescHyzwLA3GLXQX9mU2Pnj5VyJSTCM/58MfTWZ7fBVjQb/vOBfhBhfyVzbAL62HLkzMJ3SkJqc/eO+xUZBAJyuzd6OX8wqVkugFPP4CvvIeap2Za5PciYPdbj+mdKKlav1+W0B7Yc5eE2PU3qWBR+yVcGF6//1pIMEbMwaj6kzMwd6BDJuNRdU3CkOPcSyJEG8H+ymn4SfL7HdJqIAX/p8JswL78VOofZOT36x92OLBkT8y27HUSJHNX+S+7zym0NkhwUr43dMqlygzHkSgpqe4WbRjfjOEz/ZDh95aKmx5yJ4HWyChILAV4F7HIO7wFKiIXN2+wPI02dx9XYbA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1770337724; bh=myNFtsEEuQ9jVV6HiQBC7W5RTQNZ0qivuad/l8QqdxO=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=TRfysWdcKfGMZVOLSVNEm1uo+JpVazhlFDQxNKdvl4SgsYZ/DCy6mSFs4rKDH5pWQZWxcA8tJWoLnEoI7Esnoj28FSe31J65khVXgLoCsRwcYqXcYzisU1zI5AChrgoKw0FbJPkIGOqhRvH7B13x+CCh55SWbIQBj6Pyvp95pITvcFlw3imVGxV482tKaGmFNhN2ve51e9Xk61Y5wa3zlujN2THFt4QRIB9Q2Nr1LroTAmK3lNmtO88DgLvh3uBBHLWguLi2tUMk0Evhg+vFSgbiCgOkMYRNwPFqE1LxA4Iw+1CdpjNaggKgmMa4t7UoGeCKpA5Sb0cRscLbV6hmXQ==
X-YMail-OSG: JaKBDYEVM1mJKLFWWlDZg3rQ_q1KwiIctLU3Uhz5wWdLY7zCi6LcL4LCGIoK8v.
 kZRualdAfvSE4KWi7wRxpBQKtsXFYP_pzBwP58tZWUShkWwwc6mVGfZiUf81AIlefhBM9lr52xsj
 3.iwtz8dcVNTuexM91ZkUZsmgZCAqKXzfhS7_XOMc4v8QCBETw8UgfFQj9vX8WjPpz2EEqjjIvmL
 wjQkOSm6TRLsMLuGDl1fU9HH1iBKvH2frpNZmhw3If9RFTbVzAxsMHFn_hJFaFwscvSQQbtNdPqM
 OT8sBSVg8SJ1.owvewRGej33phKYyiFiGETqVpvGsJAKraQuFQWRKtV.TLQ_xmCS5r8rHB7fVdBW
 iGhCDkDLI7gJsIo01TKeN1Yhrr224vmm8G0ybybOcqsbMt3RDcGRkzXamJEE7ccCfkV.eLMIcD7n
 wU4E2UMBWu48V9LCSy_kNuSCNz_JZSItoVNwkCXuUzBRVHhR6I7I2Xf2XT0VdRzKgqsvvMgCnU_M
 7xusw6uQbjGaiRjF91j_fMjqNPQIhPZKc_5GKd.pZCsMgyQMJtgn8zPyNe7tgW9EPzbJERLLdGld
 0rGivKotMFfLjiTljI7pIq7s6Ll5cWgvhjq_GcR6epxBPd6toUQ_GUq1SVsXXMSc2u4zEdnPUcAR
 9aghPdXPws.U_yrwRLRHnpIeNyHetGfXCZ62qxbLCzVnaQVAJDt_PGhKEwb_.SbMlvsUEcoU7SKN
 cR0hsJx_wLh4gHhDNaiGnOrout5NAs8zLv3c.xg5t5o70gJdUSiVKSMa9XnS1UXJsUYHniQPwfEU
 hBUQtlRdwlp2LhlymYznhhzp0IVHI0Ww4YokdHs0vhZANS5Ai3RH6Pqg1.FsRB8YLcQTXfyut54i
 R7fIJuftJ2joi7EBUu3h3318ZuQrQ.fMN5xemRMHfHRB8z3Jf8XuyMHJ6jbF7SaB3ECZYrfE7L_g
 HnOE2_3lmtTzoSnxfPj_B97fIDuzrYTY6rb_3YRKIoBVeNhrmDsMILEqF20OJZpBxjPHqABp2kGy
 urmwGYhKqXGlJz2c0M5zpP_rBs2RXMS0FNnUAjXaSeEd0hsjeR0SagS10xThuVDX1Op4N4HHP2l.
 6AzdHX4q45CTQbTggJ1teQsaqUl5Z8EJt3jy0MJw71hGVvXQJQakl1Yj8fK05WRGyAEgqpSUvH4K
 TRG0mx2r4GfufVgJ4rko._NX1CECWUPF5f.PAtn8FxFPgmgoWL2lc_Vje7ERUlal_HW.2kDCqOr5
 mzSFTNP9epSO3TTLl485QUcXp6Gw1bGoDttaKBV9O3Dmg9JNG9QFNxQ6zZpi3YxxP0tIlpd.AAEP
 e2wgbx9in.UNIaiEH5V0.yvy0l_2NNy5pnfQbbEaZMNgVIqg.2LDDPhGSz9IVnd4kYcoZOkDkfx5
 SEumlDgCA.n4qF9grh4v4qFF66D5TEPbXO2IbC82XCRYIpMfh5MfTWZdE0L.Ek48VqKUNtk2Junb
 vUiZ436s5xDaopOeAdm_.kq7Aus1U60UsMAs82dryosWTciWQzSkuU61fxjpWsOk765Ic3IwV14M
 wprCe9X5oJ7.eqIKhbbQgHjckgYjxL71nj6uyqJuSaXeazpEZRuufa_ASCiX49mrY2zNnH1PbCae
 jHNoSQzgvOt0wgw54ccXYIFj4j3yyK.aED1y.PDGhPpd7DZhCMRze0sUdkpgYCmPl2IJt1Ui18Nr
 H9cPrtpfCgSwtYQcC1u4Q4Baqa2xo6erAo3XFNcHGti8IWC5nR1dFqnFBXlgvzz0GFW7dbAQ6r4b
 my0CRMAnACZmx1H_RQVT4uymhYeQtC9iF3X8IhUxFEZ2Qw_jTpIqyN9JI33dM.93bqf7ASUlYnbd
 U2rY3GTpZ..UPt.pmycEVaAM2.cxagsqd2xGnWKvtuCuNoAzACfX7J_a7EINCdCNWdu95kaiRZpm
 XsfdEbbxRk1dc9eRsg9rxxw0wVQ0EewNJh2CPLsJhKryOaI4G7PPL_13bwJFWjA08CpAzQjKz9gv
 OR5Jqz5.asnotidbk4c19OQvwh577v7OX.UjmlMZcikbijJfJ7BM.AOK1IbRzbagSbtSLwmKdKdu
 V_vPDayV6QqMxwq_A4VukNhJHzjXS3f9KB2jLtapSbdwnJHkw_3aRjozo5Pcnae.QsIPN_NGIcmn
 yUOi.A_Q9f9pnGIP4vtBFq1iUPb2BrPj89QTdkSXFzfBQETvvgfzfrHgDw3gRg9RS1cXNHWhmcFD
 zRXZ9RPN77._4Edfz1YsAFnje_VTgmH4jj.chNpwk.BPi1g--
X-Sonic-MF: <kaizhetan@yahoo.com>
X-Sonic-ID: 19f8c011-76b8-4dd8-ae59-988dbac8508e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.sg3.yahoo.com with HTTP; Fri, 6 Feb 2026 00:28:44 +0000
Received: by hermes--production-sg3-d7b46f8d-spzxd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 86e2b00fce6bc8eb8dea98c1adbc9eea;
          Fri, 06 Feb 2026 00:18:34 +0000 (UTC)
From: Tan Kai Zhe <kaizhetan@yahoo.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unnecessary blank lines in rtw_io.c
Date: Fri,  6 Feb 2026 08:18:33 +0800
Message-ID: <20260206001833.16857-1-kaizhetan@yahoo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260206001833.16857-1-kaizhetan.ref@yahoo.com>

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Blank lines aren't necessary before a close brace '}'

Signed-off-by: Tan Kai Zhe <kaizhetan@yahoo.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fe9f94001eed..a0eb7ce19334 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -59,7 +59,6 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 	_read32 = pintfhdl->io_ops._read32;
 
 	return _read32(pintfhdl, addr);
-
 }
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
-- 
2.53.0

