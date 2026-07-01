Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708BA348C44
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926577; cv=none; b=EVenv9a2gEuMWw7OUyx1cWwhuz9SCLapTL41owCGO2pS7gQ+3CADYCuBLrpR19lW0LZkczl+dD2DAm4gW9dStlgie3B0KaJvZaqNyRt8zIUfEdnZ5SPHSkToF7a2HNe86wr+sh2i0SSE5MU5VYGqp9ATKdGYcHT7BLiISqmcg1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926577; c=relaxed/simple;
	bh=X5Y4VVZkiZCIfSDvEHN0PchShZDSL+6Bb5z4AG6HoKM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Y4KtKmLbedy44SDR3v2/5m5zZmpOjLsR/9/+q7VENRPIpYmYM50oOqSLE/4sO+xljaK0Z6LTSnIzVhEB2l7OhaZ9KYrHT5naLT27dqLnC+OrhERLLcg4dYvYY03LYtj+lKI1t0IRCc5NyZTnCG/12uz5JcRdKUYvQ2hyaJbBh78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com; spf=pass smtp.mailfrom=luaberry.com; dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b=DW1VBKz6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ilZptKbZ; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luaberry.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luaberry.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luaberry.com header.i=@luaberry.com header.b="DW1VBKz6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ilZptKbZ"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id AF2851D00084;
	Wed,  1 Jul 2026 13:22:55 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Wed, 01 Jul 2026 13:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luaberry.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782926575;
	 x=1783012975; bh=X5Y4VVZkiZCIfSDvEHN0PchShZDSL+6Bb5z4AG6HoKM=; b=
	DW1VBKz63qREbXwLl6jexaeKn7uirxFSqOlOdhyxkgwxw+VcyXJ4KhxmBPowVxsT
	mDZUsiU5gH6OleUOZMndec+L7ITNWJqSJdjZ/tfZSPEwa5H9JCIuaiVO+b2b/dli
	OEK2glkDf9qZ2vmtSHNrna2zvLdIFxGLO2ORq9EKOCPloF0b0SEWp/vLoWrDiL5r
	O/emLzfoHZgaqjWt4UDaqBTz3P4MUDApp+qNsRPk3GxzQqzUr5vP2vGbUDISchaQ
	gOQzkqMoBW82Y7LEH2Xkqsk+Z9nuopgaW0GnajYmIinhFAsDDXBS90fOoZxEcn7M
	wYuzaMye7VHItvRxEbwvXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782926575; x=
	1783012975; bh=X5Y4VVZkiZCIfSDvEHN0PchShZDSL+6Bb5z4AG6HoKM=; b=i
	lZptKbZeLEz3loXr3LCk5pQsAdRekcgqx2qBuVAQ6qB07JZi2643NQkKgRKjhos5
	l5n12QmXoQeL6M6m/cIIOHfzO1li5T2QzWYJyaGGHGraNnXtU1D/m0siGGy5cPxf
	QGqiPRjVbFD9S/TxfpqvTtedHqaFBcKuhMiBAhl3SU8g5p4ddwpdOrJKcUJBa8Ul
	tuWbFW4iGRlc5gCX811xNJ8u0OQ9t/u8sXNFJduDw6UpQyPFbVjJoM1EkPTAA/Dt
	y+huhqGJjWKWcaI6lpU8VeWowpt9F6HxOxKdLXcxzUUsmbmjydZv9mO9AnHvPxWX
	DCIdnm9POHUbjCatJf1lA==
X-ME-Sender: <xms:70xFagnVSdos9hchodEmFBFJdRubfVMyIPanIMi_Kae2bNTx1BIUhw>
    <xme:70xFaqqesFQSYrB-0B8n8TZzxBEsP-OgKb40vazRO4umo4R8faJ-NxfqXbqkVkmaq
    yH7GBsZtFreVsj43sV_S6QoifEbKocMrbaYQN_6K6MzRBz8A0MTS4k>
X-ME-Proxy-Cause: dmFkZTFW56SnLu5hUMemt9inLXuRi8LOE6B2T2byLslo0Z/0s4XkQO4GVRG914f+LOtBWw
    jUEAoDiBNJB5Mc5jDU8mrx2MWbtIyX44ACumKQz08jLK6qV+t4Asf1hvNuuP3j4ih/7IBh
    F3cJN0pdUpmyk9i6Wwg2PdzMg6WCpI84NELVeKYbBu+KFH//Gy0Pw+WNe0btrUkbQ8vpIC
    fPLO8Izo57kNY65hkW9pnEiIEJ27FKx+pImZAgyHJl2HW4VYLFLl3z19x9y5R70C8ltzVb
    upe/aUzzJ4yW5318PLgKEAMtuV1n1LbjHZE/RQEYYqU9g1APLzoxscJt196qDGjhAY1utV
    TYzVdS8749uhDK1Ei8DSVE+qgvfIxr+ymKPReuCjkn45fdLhC2Xo5TAwJqKXOaZL7i87No
    fer6PjpVRsc+dqz9SogCDzdDAsYe6D3pOGKFTOcfP6EX0xIiddDr0UfWGspzAzBGXbXdae
    SfOqy9pY4QDuTbicTK95wKqk262cdKyeMvZF/idOFsS9G1805bqMQVFi4coXr2JrwlHioh
    OIlr2zbgNX4n/DADykZMmfoj6DdR9URpGKiL01LhNqP6dKVlsxUiiFupElBILBAYQ1S1vr
    RbUVQLcs2ocOCqhYc/zx1B+FikqQj3XdfqOsQFDOFmXDwxY+pD6nbvEt0LDQ
X-ME-Proxy: <xmx:70xFahTMuSXSdL-jkBxwiAkCQL5kMBfz-mxskJYZ407yxchiXtW2Cw>
    <xmx:70xFapBiXtoxaRNM6-N9fLgbgP4dM0QkRruXrNiiNMHS4ljV99sT8w>
    <xmx:70xFagKby3o2MFUx2An3HICzYknWpwswKPQYRdDhj5ygFUD_Afo1UQ>
    <xmx:70xFasCesc5pitFmsdqfwj3duRRsOuy_t1CZD-IuY-yWXbcOQyTENA>
    <xmx:70xFajMMyChWspveBq68hBEMWJ7n-0uZJ2Xx97dBRWJc6EVEhZlAXNvN>
Feedback-ID: i372e487a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0D484C40072; Wed,  1 Jul 2026 13:22:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A74LFP6wUQ7F
Date: Thu, 02 Jul 2026 02:22:32 +0900
From: "Jeongin Yeo" <jeongin.yeo@luaberry.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org,
 "Greg KH" <gregkh@linuxfoundation.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, andy@kernel.org,
 matt@mattwardle.net, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <69b5aa9d-03ba-4082-9350-0f803edb4d06@app.fastmail.com>
In-Reply-To: 
 <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
References: <20260527073705.1544479-1-jeongin.yeo@luaberry.com>
 <CAHp75VcL4KK=K4ZhT+Qc8VWUBsdaPcjcHJX0WJu8cty_fpJsOg@mail.gmail.com>
Subject: Re: [PATCH v3] media: atomisp: remove redundant prefix from dev_dbg calls
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026, at 5:05 PM, Andy Shevchenko wrote:
> On Wed, May 27, 2026 at 9:37=E2=80=AFAM Jeongin Yeo <jeongin.yeo@luabe=
rry.com> wrote:
> >
> > Remove the hardcoded function name and line number prefix from
> > dev_dbg() output strings within ia_css_binary_find(). dev_dbg()
> > can already emit the function name and line number via dynamic_debug=
's
> > 'f' and 'l' flags, so embedding it in the format string is redundant.
> >
> > This resolves the EMBEDDED_FUNCTION_NAME checkpatch warnings without
> > introducing __func__ to format strings.
> >
> > No functional changes.
>=20
> LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>=20

Hi,

Gentle second ping on this patch.

It already has Andy's Reviewed-by; is this patch ready to be picked up, =
or
is there anything else I should address?

Best regards,
Jeongin Yeo
