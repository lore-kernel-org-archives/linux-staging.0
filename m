Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758027E1D7
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300341; cv=none; b=iIcXjyq2nFZiddNbSh8C9waACwfE9a1IBC6/vkfxXIr6eQZhf+i8EItXLu7clY8tT7mYKB6TTt6GfDwIdjNcvQ7TAA6PJN3bzPEKmezMmf/IVLDi22i4mgVDygmDTuAyySmEdVm2NrzI3Njndvr5UfjLRamM+yQvcMUb+h3Vtnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300341; c=relaxed/simple;
	bh=pSO6ecW8XclIS7VT2nYQCVxnv2vzBc7MPO2kjkSYRd0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Btgq54WJ20fIUrEi0sfaa8TWLchOQCQEvd+7wcB2Xp8KpqJskquTDj0tmYoMagXcOEttr89reZ46V3MfOffG0P8/kkSXkutCM/QLGPThBfTo0MzCZEEKfIaAn5ofsEkIn3/i64FRlofSbCAHfqVpHQR3Bd7sONC4niPuOOin1Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sbT6BnQ7; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sbT6BnQ7"
Date: Mon, 27 Apr 2026 16:32:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777300336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFFlKVRZEGdS5SUQwovr2LL2YTAdLPgfJ+V9hBVrCTg=;
	b=sbT6BnQ7icu+/1ikb6M1NCIJR/zt6z4DOPda8OlY/yCKb92OU6M6ktqTAaG7hEtHpkqu2l
	O44n6zGS+XfavIMsMukTB1pZneV3dZHEffxzhMeZyvQwhtflyA1GkA5wCCqOuZkW8T89Fs
	Z76fwkLIRmnTqUfl2Gg61Tsk2r1CD08=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>, Dan Carpenter <error27@gmail.com>
CC: Alexandru Hossu <hossu.alexandru@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_staging=3A_rtl8723b?=
 =?US-ASCII?Q?s=3A_fix_OOB_write_in_HT=5Fcaps=5Fhandler=28=29?=
In-Reply-To: <2026042713-buffing-recite-c3d7@gregkh>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com> <20260427081748.3407939-2-hossu.alexandru@gmail.com> <ae8pq5YzEe2wTJmx@stanley.mountain> <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com> <ae8w9tkpM8G2NWWM@stanley.mountain> <2026042737-riding-bunkhouse-f8e0@gregkh> <ae9db6KjYMsFOG3F@stanley.mountain> <2026042713-buffing-recite-c3d7@gregkh>
Message-ID: <A9FE9889-BAF5-48A0-A3BA-564A0529AF39@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 27, 2026 3:11:28 PM GMT+02:00, Greg KH <gregkh@linuxfoundation=2Eo=
rg> wrote:
>On Mon, Apr 27, 2026 at 03:58:23PM +0300, Dan Carpenter wrote:
>> On Mon, Apr 27, 2026 at 05:11:19AM -0600, Greg KH wrote:
>> > On Mon, Apr 27, 2026 at 12:48:38PM +0300, Dan Carpenter wrote:
>> > > On Mon, Apr 27, 2026 at 02:28:39AM -0700, Alexandru Hossu wrote:
>> > > > On Mon, Apr 27, 2026 at 11:17 AM, Dan Carpenter wrote:
>> > > > > We need a little change log here=2E  I was hoping you would pro=
vide
>> > > > > a link to the AI review in the changelog=2E
>> > > >=20
>> > > > Hi Dan,
>> > > >=20
>> > > > Sorry about the missing changelog, will add it in v3=2E
>> > > >=20
>> > > > For the AI review link, I don't have a direct link to the bot out=
put=2E
>> > > > What I know is from Greg's reply in the v1 thread on lore=2Ekerne=
l=2Eorg,
>> > >=20
>> > > What about a link to the email on lore?
>> >=20
>> > Sorry, I was on a plane with no connectivity to look it up, here's th=
e
>> > AI review for my patch:
>> > 	https://sashiko=2Edev/#/patchset/2026041408-grill-mahogany-d1e3%40gr=
egkh
>> >=20
>>=20
>> Ah=2E  Very good=2E  That's fair enough then=2E  The AI is very convinc=
ing=2E
>
>Yes, but is it correct?  That's the problem with these tools :)
>

Hi Greg, Dan,
I have reviewed this patch=2E While it successfully prevents the oob=20
write, it unfortunately introduces a functional regression=2E By=20
enforcing if (pIE->length > sizeof(pmlmeinfo->HT_caps)) and returning=20
early, the driver bypasses setting pmlmeinfo->HT_caps_enable =3D 1;=2E If=
=20
future 802=2E11 standards (or non-standard vendors) append extra bytes=20
to the ht capability ie, completely discarding the ie will silently=20
disable high throughput mode and degrade performance=2E To fix the oob=20
write without breaking functionality, a better approach would be using
min_t() to cap the length and only process the valid portion=2E
Separately, while auditing this path, I noticed two pre-existing oob=20
read vulnerabilities:
1=2E The GET_HT_CAPABILITY_ELE_RX_STBC(pIE->data) macro=20
(drivers/staging/rtl8723bs/include/rtw_ht=2Eh:81) unconditionally reads=20
from pIE->data[1]=2E If a malicious packet provides a pIE->length of 0=20
or 1, the driver will blindly read past the end of the ie's data=2E=20
2=2E In OnAssocRsp() (drivers/staging/rtl8723bs/core/rtw_mlme_ext=2Ec),=20
the ie iteration loop for (i =3D =2E=2E=2E; i < pkt_len;) does not verify=
=20
if i + 2 <=3D pkt_len or if i + 2 + pIE->length <=3D pkt_len before=20
invoking handlers=2E Therefore, pIE->data isn't guaranteed to be bounded
within the received packet buffer, allowing oob reads simply by=20
overflowing pkt_len from the air=2E
I recommend revising this patch to use min_t() to avoid the ht mode=20
regression=2E Since the oob reads are pre-existing issues outside the=20
scope of fixing this oob write, they should be addressed in separate=20
patches, which I am happy to submit :)=2E
Best regards,
Luka Gejak
