Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225582C2346
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774771391; cv=none; b=Kzljs7ibO3+He1I215MR6qsixxT0fZOM9sQcl1+Vr3dYe1xp2ZjtOMoXlai0z2CbccMJtWwWCRoVsSllhNe11DEwvldI1P1FrwJ79rbS94CmySmnDtaSZgCRxBecQMpCRmHe0+80Hm1PvqIMMCsv/N4jC7COECZLEwY9brwEiHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774771391; c=relaxed/simple;
	bh=ES8Zmwl2yXk2qVuD7iprvswsgwcrz+A3NTNkT2wk7iU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=EqqMd7M/dzRD2uk6TsEtMPw3/eT1F36NdcRm+nSU+Epenfa6GS5yZJhg5j2kFxpiGlHsnTogtQkN6MTN8cJM/uKsb9bqlI8iZcKIyLK3MTPRHsvpx1+GlFBGX9B4Yt/driX1sUVAvZE+lUPE5Ss4oToJaZhYBRpg6TFsAi7slBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LehsdY2S; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LehsdY2S"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cfc40e4158so419049985a.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 01:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774771389; x=1775376189; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES8Zmwl2yXk2qVuD7iprvswsgwcrz+A3NTNkT2wk7iU=;
        b=LehsdY2SSS0flHBkFrK8gGASiUdEcC9sFFTYBeCwQSrAuVt1FUO4cWA8Flf6shN30o
         mCXlGyoGCLJdEmuDlHKw3L9OtA8G+JHzu72CxjLp/ecbCAu1Cu1lklDHh0WxdqzaAFiH
         EhcjV25CgxjSbZHi9TlnvZ5+/nsegm4A28m4HuXPydofwNAh+rQRVtgTLu8utP/QURF6
         3xyHWt+LVNH+un/1CCFz8vVmz5esjzsFqarWKMZX1MKElsV6GOC/8MZxbZ734/3S/hhy
         Py4gb0W5oZrM7NFbn3r+3ejY0JI027dNrpT07JyfsAhipnRY5d21uBOqO7tbKfZrDD7i
         YEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774771389; x=1775376189;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ES8Zmwl2yXk2qVuD7iprvswsgwcrz+A3NTNkT2wk7iU=;
        b=sVnPjKzdIaqIMUOFSqKAMimScCpcMUYnO9qoo129TkR3pUAuoZHwTvXPxTMFjAEDCc
         7ZDygIMrs+MURo3bYOgBL/7cTMTupnkE3X8NxyfW/FJnyMIeNHHrX+xcpW6cySm0QjEh
         vTaTPZRbrXcar4e/smIW93r61bx0tIW5oSXleSva7dTLmBc1n0DF7q0N1a0pF2VHVf/5
         Nx6tsILHDduVbgpECnx+B2da8koi0Jb6BFRXb+0BTXZjTOEsbtOstlGMSAp3l2PF683P
         c/GXM+gVuG0J3i+CJsfFtxqFzKgcqDZUEDuCmPedJMtvJbKb0uGg48uPjfNTdHBunXJO
         IQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrLhCJJ+7VpVokB9WREHTCdblRj7uKI5EpGPka5PFlWYwiHInUlvC5h2LfzeBS5MyteWZRG8Tk2OTVdCD8@lists.linux.dev
X-Gm-Message-State: AOJu0YxU481LQpzBXFPyxwvNmhH359oLZTQOKLg/cIJQ+tvsDkGrK4/7
	RWlhymRKRuLnFht/4cIXhcsBtMgxiHh5FtOfgznS/Hs4yvi81CX3Dtsx
X-Gm-Gg: ATEYQzwIgmpzsRvi4ODHTMm5Rk0htjKE+jt9uHaHHsXk3/sJrx99F29zhYy9IjMw/Nm
	31gpDSHaVBlfZ4ePSP7O/QCllLrNViNw/DB+gMWFAN6EAnHX+aidMihRW6lQmOwMth+/LQDmSPD
	JkXd51dSAuLPA4gHaIgrSXdsY3gNsj6+ryOFSeqez4OzczPui9LC5WTKnQTDq/kWBUq6m28lpSI
	Sqf54Vfxhi1Pmp0J4cNdETUAOdLINBfgiaSsxqcmgjvVvNOHE3vLkvYitXB5qp3BDN141JHNBap
	8KnWl1OWItNE00P3IXrnXzFJgJw+VyfbR7r/RX/6DuOAzjGPdaoRjYBwT8YWGn77s8ZN3ASH2wW
	0kbRDw98Ki8JJIpBPw31ariYP6lcwvSBMHvhRZntMbetJ6e0XdS08d3BfHZLIzKueuww97Gzwuk
	8iSJpV3aNOq7mu0i0aT0aE+l8N8w0Raevgi7VA00qb4NnwTA==
X-Received: by 2002:a05:620a:44d1:b0:8cd:8938:f026 with SMTP id af79cd13be357-8d01c840348mr1069914585a.53.1774771388878;
        Sun, 29 Mar 2026 01:03:08 -0700 (PDT)
Received: from localhost ([2601:5c2:100:2f60:11f8:78ef:721f:37c8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02803f1b6sm331804385a.22.2026.03.29.01.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 01:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 04:03:07 -0400
Message-Id: <DHF3Y80H76YG.11CWVL4ST36BQ@gmail.com>
From: "Xiyuan Guo" <tommyguo039@gmail.com>
To: =?utf-8?q?Bera_Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>,
 <tommyguo039@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <tommyguo024@outlook.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warning for
 READ_MACREG
X-Mailer: aerc 0.21.0
References: <20260329045447.49789-1-tommyguo039@gmail.com>
 <20260329062231.10536-2-b9788213@gmail.com>
In-Reply-To: <20260329062231.10536-2-b9788213@gmail.com>

Hi Bera,

Thanks for the feedback. I've rebased the change onto staging next,
and submitted a v2 patch.

Best,
Tommy
