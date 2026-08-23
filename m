Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3818C23EA84
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787504567; cv=none; b=TaIaHqfG3T8/IOJlUBx5sracARIaOMeXknc71SrBxveTsfMxL/B8C7AKv0B24KtcVd8D7m7fODEZoLisjh6l7xNmt7FJPyY4PrL23ZHjITXYW8P6EMM+1iPe6PM+ZglzzsoygDU5fC57bwvAntYStWrf1R7dMXuSKa7u4a7oXSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787504567; c=relaxed/simple;
	bh=+JRbrld91JA49qP8Qn+22RNY45slL1vhjg314bA+pGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIRl20mbh2rjK/OAcb1qST1eV8x66PkaE0G1cph2FhJj/vBeTuQ+N7euyObUD8rfVCqMAUt3Rfq+VTLQb3OwGdiOyV0MntUW/EACX1LpyZHiCVWkOErhyU39VNIex+lOOL1vA0byuOWzRMBooTQtTNic1IMeN7xkPnU1EzVP6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=M/EBgOSo; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="M/EBgOSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787504563; bh=CBxyGarE4QAo6QUUmPlCc1FZfAD/L83VDno3fYwaR+g=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=M/EBgOSoMjKLhsgrwl4g9m9rl9BUD9zMtAVK30H8nehsSmUXJMP2bIilbEzOxLY/rTmtknmdBHsC9rcwzas5QufFat5pWtEJx1ldCWdQYG+241HsqnqlSYbf8RVEKSlaq+R5AepvzO26Rt1YSYMzGQyx2ikRGmfapVZMouCr7CkJD1dArCeQbOHZC0OM7EipxoUQC1HxJmnGBTfmkJ7hwmD7N5zYDGx1wNG+FClv+DY/hBfu8pPBbZFqr9lmMz1SylQj66sn+EbsE/8W8U5MTCAJLA1sJkR3QBIqL0zN7l5M8mrnB7h2Ueutqp+4Tne5byagjcmzKiOdGTaXk9K3+Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787504563; bh=uYc8LAWtYD7JAtpyoD8PtqgIqMLIId4BqXL+JiZEbZ5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=uLtckLlh92YcIV2JqDKY+G1HC6e5WzgaBXeFhP8r6ElYLUZFkRnn4MY5TKMMbOt1WjSzQkKo7VhLsMTYZQo0ullPDQT2N9OWk2nxQ6+wph5in1u3lFBw5wDggjUOFWkZHugcGLTPDd1YBf+Au7mw/+YRWj+638zTpF7IzZsfCDY8/p2J630zFPOXmZJTGTcwdlZYRtssfxpv+a+c7Euy8AWZ6u+Esg8otUsa4AAZ5+VEm2UjbpVB/dUZ0NgPseOwpxrV6ciNa2wlOw9sF57T4I5ok3LAlLKgEQ77aP9TTKhies6xuJevYzONIQ13Ka5lY7rR7pdJoxpUksJdLZvmbw==
X-YMail-OSG: JhhXDf8VM1mPt2_zeRsfWAJW0tMIpHgOvHwFlf7yjtvyAlwwo.eWczP3wpvO7nH
 v.IZFNro8OSyXpWkyhUbtlxalHpHyb1Gh6EofDAGPC1618MnVYtVcHFOrKguCZeRNmmZlbfRYX4k
 orpOJNGlpG_e6VwNt9igo2HbWCWlVUpmL5VE.8TGNMB6tk7m2c9GTMfvV9dbyWfM89EcqwC1Dreg
 Sgh__qzGWuCPBA.W5uUVItBtqDR3FgVOXLyxs2_9m5bqAPKlzzGHQvT7_w_ABE_.t7P39DnKumlI
 vx.mEDMooxi3Q_kWMlj9Hitn5ZdslxLtMou73ARN0lbbhHmjmOg8e9eGUjInWn9nkTF3n2ntIDzD
 CE5e48WIm7YryU697xS0MPIkRxKq1ZuNSkX6n4YzrrzSC.wirUs0Ejemw1Squ2rUGrAbDBF53EjB
 0mEUZSvb0ZqIXfEkZsNEaspmhIXjngx8dyvmnxUBM9wdlcs_7cLTP_MfLM4Q9QJ176v0jc6gT_ax
 yL9KOxXVVKCPiKsc7hoFxjXKbfL_hq_PsLhATSWw_ZKDdl2gTL.swtcvTXKU0rtYOSr8DlqIB9JX
 WsliNlkidrbaPxq_r75BrnmWxfM4TkjtZ_udn7fyUga97hpeToQeLwHhLawYKnkRmyBF87y49l8X
 qOCJ0a1tpzMskGoMj3zg2NuTvYOYHq9SMrYViyBCiET75AEB3nRc.xfYb9fWdvxaUR88p6VGP6NR
 d6AhWWS7P31kSph.pDqLQLzv6XfLanlaN0A8NTnO_f5gJIbIByu5.ayNkf.Rflyu_2wNaF1UsABC
 Yjk8itop6m6ARemFwab3aMB4iWKJLXC7AE3b4pOdpaLibR3v.N1JTG0zbsc03h5ngbae45SNocDV
 sWd9unp1N2Vrjdp4O4iSkUClI27kpEsy.FhSMbmPGpoSDkmCaFiCCx.SMpd0ERdSx5GLNe1sBcLN
 p6SlYZg3CSBGGGnSahW.OUsSRUkDf2WoMKLjOttl481QsLz8uHtUWYUEsXRMa1_FEpYTwLodUPsa
 iyJCLBzWCG6EalamZGC0AH4paJ27Oy95GvOyNeZT3RrC7oS6gAtlWheF_Sawr3pbedIsj0PbeTSJ
 67nnKFJyRLNgFT3dQhtnqdph.YXVnXmYgFbSipzJkmVBpswW65f1Of4KUb6nUVpVBTqhUbzYuc8u
 ltDMqWOt9A0j74p8nzOJZFz4DKcJtMnO5rDfCwZRf7VhlCO6CtGKTcf2yRfkJQZbTgggQl1JNif6
 T9wiTbj9jzLZgI_XiwtdhlPbRpRUM.aK9LLt9nULNuDK4qw8.vqeHql7uIDRhjLCLmqT49g7.hG8
 CU.bNCLYDf4iUpHPDeTAu.76oPAbGJPaUVdajkGj.l1J8BW9_C1.mfSu.vigruEHXa6VPdo.ZBsW
 iclXc.pI9MGTrf6MQTP9mYsrgupP.5DxlyQgF76.I9Zn5Gl3SwUJiZ3zR.0co0LgOZsExRt5oTwy
 7R9Ff.U_0_YnpPuQsjmpkclXBK23NC0V9Au4uPLkhxc_vZHnPVN9RSjMu6fpnQj_5sRH6xtluwg_
 i7fd4k47o9empqEch9zdgYLOOZtkVqoQVEQv_cK.BQuAjlFhN.mQ5FcESQijtwI2FGCNisuO6qP2
 yQLVcOECRpDgE90rQ8AWd32xlmKqP7vzIJRGlLQpr40EiVMgpcubEbCBtkOl.gWDv4HF.JBZ1Dkr
 tbWuofXUaMEMbh4IU_.PSTJ_vkcpsaes8sujzHRVgwlTt29tY_UlrrnVTTARNewOrgVeVILif1SD
 dg8zGQXCCtblTHwPo8WWR34TjBOmG2P0BvN6ZvaLN54XTdqZlwKXTFJgbgVPZw5SQT6ZcNHwBLVM
 RbQAI4S1DhyC7XvKnV8B6lEW3tPD3WSbxlWFkVvg8HCBCYl6AgMfiurOHIBc1uIy4.xNgwC34Ij.
 rAqIk6yuir8XNcJlLwpRbLELud_SX7JalfahNCEoOyDW8gHXn2v1f7TgfbPNEEvin2nyaHvipVf4
 cMPseFhx9iDMRqg7wl2LRvs86hlRp1If.vwKQuNvSoCvb2A--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 9edc4a61-be23-4291-8921-2c5dd37bb845
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sun, 23 Aug 2026 17:02:43 +0000
Received: from dip213.lsn.ir2.yahoo.com ([87.248.99.222])
          by hello (SMTP) with SMTP ID cda42a50c8cfb81bc4fead7192565af1;
          Sun, 23 Aug 2026 17:02:41 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: fix space before tab in rtl8723b_cmd.c comment
Date: Sun, 23 Aug 2026 19:02:39 +0200
Message-ID: <20260823170239.229548-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-1-11f2600e470a@yahoo.pl>
References: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-1-11f2600e470a@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please disregard this patch (1/2 of this series).

I already sent a fix for this exact same line earlier today, in an
unrelated, separate submission:

  "staging: rtl8723bs: fix space before tab in rtl8723b_cmd.c comment"
  Message-Id: <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c@yahoo.pl>

I did not check for an existing pending fix to this line before
preparing today's series - sorry for the duplicate noise.

Patch 2/2 of this series (rtl8723b_xmit.h) is unrelated and still
applies independently.

Noted on the series point too - going forward I'll send related
patches (not just for rtl8723bs) as a single series with a cover
letter.

Regards,
Tomasz
