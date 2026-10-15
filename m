Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10253F6B2
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079847; cv=none; b=KI3wz9SvzrzvQellZPeIJrLp5PlVdpwDGkoJGex4hnkOIqloXwZaM7IWpLcoMSU6ZQcYXb+gYqy6qRMe+TfSei3np0lx3nc6C5fBlTG7wfE2BRaMLSBHm/7BhmcwBw1q2J26fxRMbUHzm2qP8LGK3Uw66AYkbicGWaCH64U6/Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079847; c=relaxed/simple;
	bh=9XrrRohksxXXsEJa/XTCK+b8gkvPG0g+P/pdu0Eu9A0=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=FYRJaI+vfRpDgf+lKYek/r5hwl9NE/ouQUBjoh2nLr9Tjg71FxwdMMFUXbtO/HPcQQaYzA1fVd15QWhuORx08+ua96mI+MigqkyWohGdUZwI9u/LSzVNM+DgUYgbKKaKlU26fbDHLDn7M8PemC710Fj+BsSVzhHsONJzpHonjYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d6KEylfW; arc=none smtp.client-ip=91.218.175.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d6KEylfW"
X-Envelope-To: linux-staging@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=9XrrRohksxXXsEJa/XTCK+b8gkvPG0g+P/pdu0Eu9A0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792079831; v=1; x=1792684631;
 b=d6KEylfWgLSYicPdKpics+TMKGnPSAUYQo6CSmju1z5O0qHaIlY5+pxAAxXaRhXK1apPg5rG
 UlL3JfiLhl6LsmvML/+Gp2Y8zFXYVBIlOzulx0ZXrDODxep+nBcpvYYR9NuTM8Lx8QPsnUcwr1d
 4wcdeqmnJz8BSaDPA2VmvqcY=
X-Envelope-To: linux-staging@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e9ad1e8e8c4ad241;
	Thu, 15 Oct 2026 15:57:11 +0000
X-Mizu-Trace-ID: e9ad1e8e8c4ad241
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 15:57:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <5f06793dbe846865b7d86f656d27caa1c65732b5@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, pavankumaryalagada@gmail.com,
 gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: error27@gmail.com, ethantidmore06@gmail.com, dennylin0707@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>

October 15, 2026 at 5:41 PM, "Ethan Tidmore" <ethantidmore06@gmail.com> w=
rote:


>=20
>=20On Thu Oct 15, 2026 at 9:11 AM CDT, Luka Gejak wrote:
>=20
>=20>=20
>=20> October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
> >=20
>=20> >=20
>=20> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > >=20=20
>=20> >  Remove redundant parentheses around the address-of operator to
> > >  follow kernel coding style.
> > >=20=20
>=20> >  Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.co=
m>
> > >  ---
> > >=20
>=20>  Hi Yalagada,
> >=20
>=20>  I'm just letting you know that this change is no longer needed as =
the
> >  entire staging/rtl8723bs driver is being deprecated and removed.
> >  Support for RTL8723BS has been ported to rtw88 subsystem.
> >=20
>=20So rtl8723bs patches aren't being accepted anymore? I saw Dan reviewi=
ng
> one earlier, just wondering.
>

Hi Ethan,

I haven't seen Greg's official stance on this matter, however as far
as I can see this is my view on this topic: the staging driver got
deleted at one point in time via my patch that goes through netdev
tree. If after that patch is merged into staging-next which affects a
file which is removed it will cause a merge conflict when they flow
into mainline tree, therefore it would be the best to just drop all
the rtl8723bs related patches which are being sent in order to not
cause merge conflicts. And on top of that I don't see a point in
staging driver getting "improved" if it's getting deleted in the same
cycle. I also forgot to mention that once the patch that removes
staging driver got merged into wireless-next linux-next had merge
conflict and its maintainer fixed the conflict by removing those files
and Greg said feel free to delete it. He also said in conversation
with Ping-Ke Shih and me that we can delete it, so I believe it would
be the best just let them get deleted without any further issues.

This email it is dictated by voice, not written by hand because I'm
currently outside so apologies in advance if something is repeated or
there's some issues with it.

Best regards,
Luka Gejak
