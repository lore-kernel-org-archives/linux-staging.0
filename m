Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E022C15A6
	for <linux-staging@lists.linux.dev>; Sun, 31 Jul 2022 17:32:19 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id E132C1A06CC;
	Sun, 31 Jul 2022 17:12:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 109C719;
	Sun, 31 Jul 2022 17:12:56 +0000 (UTC)
Message-ID: <f93d3ea32ac04a5edd8159abcb0504f71fe7aee4.camel@perches.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: convert rtw_set_802_11_add_wep
 error code semantics
From: Joe Perches <joe@perches.com>
To: Phillip Potter <phil@philpotter.co.uk>, Dan Carpenter
	 <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 paskripkin@gmail.com,  martin@kaiser.cx, straube.linux@gmail.com,
 fmdefrancesco@gmail.com,  abdun.nihaal@gmail.com,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org
Date: Sun, 31 Jul 2022 10:12:56 -0700
In-Reply-To: <YuV452xuR1S0WyJi@OEMBP14.local>
References: <20220728231150.972-1-phil@philpotter.co.uk>
	 <20220728231150.972-3-phil@philpotter.co.uk> <20220729064803.GT2338@kadam>
	 <YuV452xuR1S0WyJi@OEMBP14.local>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 109C719
X-Spam-Status: No, score=-3.37
X-Stat-Signature: 4a7yuztp7sn1a8ou8bq714ogqwo51tcy
X-Rspamd-Server: rspamout07
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1920Q3wvMO6LZXRhz1V+zVQuvrxQfkgkjk=
X-HE-Tag: 1659287576-312776

On Sat, 2022-07-30 at 19:36 +0100, Phillip Potter wrote:
> On Fri, Jul 29, 2022 at 09:48:03AM +0300, Dan Carpenter wrote:
> > On Fri, Jul 29, 2022 at 12:11:50AM +0100, Phillip Potter wrote:
> > > -u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_=
11_wep *wep)
> > > +int rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802=
_11_wep *wep)
> > >  {
> > >  	int		keyid, res;
> > >  	struct security_priv *psecuritypriv =3D &padapter->securitypriv;
> > > -	u8		ret =3D _SUCCESS;
> > > +	int		ret =3D 0;
> > > =20
> > >  	keyid =3D wep->KeyIndex & 0x3fffffff;
> > > =20
> > >  	if (keyid >=3D 4) {
> > > -		ret =3D false;
> > > +		ret =3D -EOPNOTSUPP;
> > >  		goto exit;
> > >  	}
> > > =20
> > > @@ -424,7 +424,7 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapte=
r, struct ndis_802_11_wep *wep)
> > >  	res =3D rtw_set_key(padapter, psecuritypriv, keyid, 1);
> > > =20
> > >  	if (res =3D=3D _FAIL)
> > > -		ret =3D false;
> > > +		ret =3D -ENOMEM;
> > >  exit:
> > > =20
> > >  	return ret;
> >=20
> > No, this isn't right.  This now returns 1 on success and negative
> > error codes on error.
> >=20
> > There are a couple anti-patterns here:
> >=20
> > 1) Do nothing gotos
> > 2) Mixing error paths and success paths.
> >=20
> > If you avoid mixing error paths and success paths then you get a patter=
n
> > called: "Solid return zero."  This is where the end of the function has
> > a very chunky "return 0;" to mark that it is successful.  You want that=
.
> > Some people do a "if (ret =3D=3D 0) return ret;".  Nope.  "return ret;"=
 is
> > not chunky.
> >=20
> > regards,
> > dan carpenter
> >=20
>=20
> Hi Dan,
>=20
> Thank you for the review firstly, much appreciated.
>=20
> I'm happy of course to rewrite this to address any concerns, but
> I was hoping I could clarify what you've said though? Apologies if I've
> missed it, but how is this function now returning 1 on success? It sets
> ret to 0 (success) at the start and then sets it to one of two negative
> error codes depending on what happens. Am I missing something here?
> (Perfectly possible that I am).
>=20
> In terms of do nothing gotos, do you mean gotos that just set an error
> code then jump to the end? If you'd prefer, as the function just returns
> right after the exit label, I can just return the codes directly and have
> a 'return 0;' like you say above?
>=20
> Thanks as always for your insight.

Yes, you've got it right.

I think Dan is suggesting something like the below, but
not necessarily in a single patch:
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 38 ++++++++++++------------=
----
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging=
/r8188eu/core/rtw_ioctl_set.c
index 17f6bcbeebf42..2736bbce83b5b 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -390,44 +390,38 @@ u8 rtw_set_802_11_authentication_mode(struct adapter =
*padapter, enum ndis_802_11
 	return ret;
 }
=20
-u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep=
 *wep)
+int rtw_set_802_11_add_wep(struct adapter *padapter,
+			   struct ndis_802_11_wep *wep)
 {
-	int		keyid, res;
-	struct security_priv *psecuritypriv =3D &padapter->securitypriv;
-	u8		ret =3D _SUCCESS;
+	int keyid;
+	struct security_priv *secpriv =3D &padapter->securitypriv;
=20
 	keyid =3D wep->KeyIndex & 0x3fffffff;
-
-	if (keyid >=3D 4) {
-		ret =3D false;
-		goto exit;
-	}
+	if (keyid >=3D 4)
+		return -EOPNOTSUPP;
=20
 	switch (wep->KeyLength) {
 	case 5:
-		psecuritypriv->dot11PrivacyAlgrthm =3D _WEP40_;
+		secpriv->dot11PrivacyAlgrthm =3D _WEP40_;
 		break;
 	case 13:
-		psecuritypriv->dot11PrivacyAlgrthm =3D _WEP104_;
+		secpriv->dot11PrivacyAlgrthm =3D _WEP104_;
 		break;
 	default:
-		psecuritypriv->dot11PrivacyAlgrthm =3D _NO_PRIVACY_;
+		secpriv->dot11PrivacyAlgrthm =3D _NO_PRIVACY_;
 		break;
 	}
=20
-	memcpy(&psecuritypriv->dot11DefKey[keyid].skey[0], &wep->KeyMaterial, wep=
->KeyLength);
+	memcpy(secpriv->dot11DefKey[keyid].skey, &wep->KeyMaterial,
+	       wep->KeyLength);
=20
-	psecuritypriv->dot11DefKeylen[keyid] =3D wep->KeyLength;
+	secpriv->dot11DefKeylen[keyid] =3D wep->KeyLength;
+	secpriv->dot11PrivacyKeyIndex =3D keyid;
=20
-	psecuritypriv->dot11PrivacyKeyIndex =3D keyid;
+	if (rtw_set_key(padapter, secpriv, keyid, 1) =3D=3D _FAIL)
+		return -ENOMEM;
=20
-	res =3D rtw_set_key(padapter, psecuritypriv, keyid, 1);
-
-	if (res =3D=3D _FAIL)
-		ret =3D false;
-exit:
-
-	return ret;
+	return 0;
 }
=20
 /*

