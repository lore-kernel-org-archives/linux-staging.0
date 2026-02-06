Received: from sonic313-20.consmr.mail.sg3.yahoo.com (sonic313-20.consmr.mail.sg3.yahoo.com [106.10.240.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225422248B3
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 00:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770338679; cv=none; b=EokmmQYJDYHfrJDXSW3eUQJTjkIrCRwEOwFkahy15pSrp5T6+/VB6bkFSIX/CzMXpH4nImvqPd/y8gy+lJpI/q6J/U7dIIt+jqtRCz6vS9pEPRf1ZnSFFKWqj+/diaL0Ns7kwRU/r5bxlpV+KVJeVZXJ61fLtRHQcXa8IwY6kXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770338679; c=relaxed/simple;
	bh=pkV8Kub9++9m36Z18xLaXA6stPLwdgIgUZJaUSJ09jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkbZy+mtAzXR8dQZB84a+Tl7XvP/Pr1ObYZp82y9NEfbIBplDXBC2PHUIMW1lvWLm5h2F1ZmJU+e4KREjRT5bMjuOtJHC66i7Ymr36Lyhi4am9mlazYfl3BCyYbSVbtOJ3IQeaFj3Ryvi8bA7CFZJCCB4Cb4jck2Xl5omWo3hoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=mHTSQOiP; arc=none smtp.client-ip=106.10.240.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="mHTSQOiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1770338677; bh=zMMZTqnzCCANupAqJviJH/QOVWskqK8MBcRSfJRhP8g=; h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject:Reply-To; b=mHTSQOiP1rmtde2RF4yKp068uSMuH5hGFw6HjwyDZ2splhdrOrj/7wqInKC/cnpvLXzxT1UL3A5NA1sPXJR0wmn0JKPtL61UXxq6sMAhPFTve2cvrFL5oiydx2lcuJMJ8dI2E/LUqoUpSlE16t2yvdY7BcTy58IyPW48b2/8aj7CD7ZVlOuZMIrUpn68Tnt0lG6+8ckf4kASYeayp4rrXRKgPycQ2gPsMoxGI0TAMHB1STk+1m9DM7zf+HHYKtBzvsY+1hDNYv/cmEf7EnDxTSUSBvUa6+P2fr24j0T/dL2Vs7trNI6bQZLVTD8QybGNU2ZlYTKmwN7oHXfwBH2zdw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1770338677; bh=LuJSVRo4bU2a4walSUcXq1nGp1s744SYNrhYWNtZTmY=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=j3AhBvw5CzYrrLTWjbYERAle10nEFP3gCcp3LOvWKt/B9iK5C2yl2mwrcqYWluo9l73nubkdu5ia+QHPCQluZp5HeS002OPZcOjYCTWZ5hD+z8HISil5NCXGqUka6SZqWIWdDThpqa00tq/JRlXuD9T8EIa6dGZkrV8q8iTtUDX8FBblYMgBjsfVgVOGpJd5uEUJS2JIMk0mpPBulnkiAaFyuIQ/eod1bGqmtwJKrn9pkh5sqb0Qav/0Go01sRcwGY940pgI++UeTC3dOURwHV9MWWQqU//k5VZRSdfZaD2CT3W20GVSK4TeYLu4ZcmOvvCnBdem5ajGRx+B6RYCHA==
X-YMail-OSG: UJWsxPMVM1kEs.IPMAhxKJzqbECKmvkjMa2HE.VhMM0tQ8rNOhS3Fst2DTMzc4Q
 .hTRUoAzrmCqU4QHbduuzrzVh3I1tOLTi4H1ylCtmHDm1zNMWsYfNfXntEQwhGhKnJ.8BWF9E5vW
 LqgnLKIkrgVHk8eML00DpMp3yCKfnsRqHMeYEshTJP.LjCGwpAcxXkmbdnUY5Ay5fvyTLGNrEc6i
 EiJfHic0wO.QoiJoNxsjfDnoFsBuY2vUBD8es1sK7dNN.Q75MRjjzg2XrSrqjf479kD.a6.503i_
 QRSsiBtHslEMxbjA.1II3y0N21RQslJ5NfxHGvet5dIVS5lo37umgAiuqXfcYMZ0.P_d6lJBsTof
 X4HPBvrKHqlsh4XLPzDwyyAucxHVHb2X3Lx5AWVtP_xbyiDp3uyBTT4xMaAG4WtbF17h1MSzvSzH
 pBiyzN_4flY0qLOEKNN7npHedCy07rNWDky42a51C3a0IYMUnK7H_FSvc1.tzWP9HM4jMfu1utM6
 QqfcA2PUrBcI7TaCH.NgDYv_F4gwvbLM3f9l9JcYdkckeZ0PT38dsydu3FhbbaQkqITxND.6sPnZ
 6rY_ByG8gQL_5a.jvUxhc.dp7ahOj8pJ.zViePhqxefS3h9vvsZNZdTFfunVbAx170tF_fMl49Qe
 xzsEzd6BHXwZl3bvDbR0fJRgbM7n85IErc82Ria_so6GEV8f.ZuMjSGHWJm6RVel4jz3_Y_aUjYU
 qEyjDioUKzvEP2NBj0lSVfpnEyLSqRjAgSQT3leNlelskdYDjKDnpHTQ6Tc84aGBPeTds_2Rw5om
 yoA7kqGoz3zpsDG0wHM_sVkZTJDwXEhmGBoZ1k5eu7kuh.W4WBOJLWguK7iFZ3zd1vklWp2BgIj_
 k3a6hrEbYkjKbylo9zt1hVBsEvr9O.vV8ImtkBqTbXqf.AkSU_axilsHw1dKioBmuz6jUiHTkg7u
 GvzcaLsmBzoCa96aBlZGqqE8CXWSd8cDLr_MvnlYaWCt4ltMGDDcHUePRhIEDdGTqhymAk49F1.R
 o7w4awFfIfeDkNTNJMe.DML8Q8bLcZzor3z6kvK3WRwWJ4GbdexAmwI_7_gAf3DEOou7UtXpilzy
 oq8tRVM9aVjHMMOKvTX7XDnI4Ti_ljaGxBhyIQuZU0OI1o9DuFy_0pm3VgnjVvJfaD2w.LfgH58n
 oIzPPmdSKLuQpuhqmbp6JhFEWWZn3QrzAvGJ5yVystyAbaPfxhwG_HUxLQMTaI9rAQZRu_ydEm98
 dfHatLTKp1lLa0SWmUTR1UyPw_qDPVjRVqxnI.5HklASGjmTT5xOBH8d5tThOpcP6Cn4bMjAMGvc
 b5re1v8Bpk8RLSLlOpKvuDp1Ucm6ab7UNg1ZTfSncmjzJ3oWA3mBh2hfzVhe_qetP6DYkqe0DCAB
 RpoomLQUAHKfL24aRp5xIVMeIMRhTz408B7s4oNKgLDvjjzeuG5RhPTmNBxFJbs8JHgUJqebORod
 7WM.7UkT_S6p.KcmimwEc2h.2.lcrLhJz7EGqD9hE3z4TSDh30YUDZy8G6OSt7LPEm8Nd2O7JTVl
 CFvYWbjIkMIPz4iTXP7.nkPtTWdIXeUKycvzhV7IuTzBZvT4FgOMPk29ClOchbqWKl0UfCfZ52QZ
 lqZ6qhIWIZy_5t3liFV0t5VKvW4vQDMDhS8w6hqFE4xyYHLRxrFQM.INTw2Z.je10iipySsvyLuT
 yRwZXlqit1Bn2u0UQUJ32iIsPv0HDhy4xM28H3QzvT6IXOvCKu9x0zNoOURe1YD_.AT0jHGhm_yc
 g9xg4fpF6.7EOcyTtGyncRPx602vqOY8Bnbv1wFooezc99R68U88qri.QnTO_q1CFP5gLn5EI0cI
 KVnuWfh8kYoYLdfSMpVRUy9DMVNQR_YhRuxnOgFlFd8T4QhKMPktFq_ZXiXOfr3BSR0SkcGaMnAZ
 .ksgYCgxfwxhGFicYbuDjMz8pUVexSx58D_okYZyCssM.1pzrGtNkncZrWUUBHKPyZ.0Ka1981N1
 64cNZbo.JjAaPHAIl8pJrkpjgon7VT8ZlZL3fmZaLiRLGof7HeEiN16qmSaYWCZ8S9Gu.hPUvYKK
 rB3gFhnXGrXQjc3w2LRV1JmlAHxZqUit4PpsM4oafIQo1kguJJSfiK_npCXdCquRUqQFz4HF.fD2
 YLqmVeVenRn.WgMnSihAVA3XiJ3_vGDMlqFIFTvA_oKGdp3NeqYyP8Ks6gdBXmSMEpEYzl4HrWv3
 6JyqKkmTMPfUeTd.iXBbf4qI2ddpBrS4IXVdCOw6ixnDNoSSnJNqv87E-
X-Sonic-MF: <kaizhetan@yahoo.com>
X-Sonic-ID: c9f630c5-f4c0-4b24-9821-bb618f823a02
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.sg3.yahoo.com with HTTP; Fri, 6 Feb 2026 00:44:37 +0000
Received: by hermes--production-sg3-d7b46f8d-bd4fn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 978e079fb4036a6db878fdf3fedbc242;
          Fri, 06 Feb 2026 00:24:19 +0000 (UTC)
Date: Fri, 6 Feb 2026 08:24:18 +0800
From: Kai <kaizhetan@yahoo.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary blank lines
Message-ID: <aYU0sgbYnRjMZHQZ@thinkpadl390>
References: <20260205151229.240586-1-kaizhetan.ref@yahoo.com>
 <20260205151229.240586-1-kaizhetan@yahoo.com>
 <DG76TBNR8UF0.ZM8O50QCNONE@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG76TBNR8UF0.ZM8O50QCNONE@gmail.com>
X-Mailer: WebService/1.1.25116 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On Thu, Feb 05, 2026 at 11:00:29AM -0600, Ethan Tidmore wrote:
> On Thu Feb 5, 2026 at 9:12 AM CST, Tan Kai Zhe wrote:
> > Adhere to Linux kernel coding style.
> >
> > Reported by checkpatch:
> >
> > CHECK: Blank lines aren't necessary before a close brace '}'
> >
> > Signed-off-by: Tan Kai Zhe <kaizhetan@yahoo.com>
> 
> These blank lines have already been removed in staging-next. Please use
> staging-next when creating patches for staging. Thanks.
> 
> ET

Sorry and thanks! I'll use staging-next from now on.
