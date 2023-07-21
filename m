Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE191FA4
	for <linux-staging@lists.linux.dev>; Fri, 21 Jul 2023 07:12:30 +0000 (UTC)
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 212F31A01AC;
	Fri, 21 Jul 2023 06:34:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id 8F1902002A;
	Fri, 21 Jul 2023 06:34:16 +0000 (UTC)
Message-ID: <a88dd19ab97721a2db228bb070c8eb5d80751e7f.camel@perches.com>
Subject: Re: [PATCH] staging: rtl8712: Remove redundant braces in if
 statements
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Sergey Rozhnov
	 <rozhnov.sergey.89@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel
	 <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 20 Jul 2023 23:34:15 -0700
In-Reply-To: <5db3658a-2594-45db-b76a-4aa40950ebd5@kadam.mountain>
References: <ZLnoBYlsTiLixTah@terra>
	 <5db3658a-2594-45db-b76a-4aa40950ebd5@kadam.mountain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: jebz3epcsf9qtfjzh1ci8to5zgfgctrt
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 8F1902002A
X-Spam-Status: No, score=-0.41
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/cYZrM9qud1+CJ9uYELx9Wwcsx1KW9qbM=
X-HE-Tag: 1689921256-336439
X-HE-Meta: U2FsdGVkX1/NIZSI6DZ9EHeHXbXRxlFRw3oTjkbrF6eBvzwMBk5Ztc3/ehMDZbFxwc9ymlx0U7PDBEPOBknEYV2E2G53eqtKB0Thfa1YK+TGeYxtQs8YBSOkrnk/KtgWQiNmbIPBKJcGeWRUhYQAyaeSrikJi6nkBR7jdd990uYlk8Z6Yih961j3Pqa+FrhCRgrNUoj0Gu3fEHjK0jbYfhVpgsjZkvqALbbb9wwzcm1Yw9UkaPLBh/F2Ui85TSazJVdHEJJFcQRhN+uzpAu1T6Kxq1Q9OQoHTMLm9W7M0tzoJceH3ITCgu6eDP5ZuHpl

On Fri, 2023-07-21 at 09:01 +0300, Dan Carpenter wrote:
> On Fri, Jul 21, 2023 at 06:05:57AM +0400, Sergey Rozhnov wrote:
> > Extract masked value to improve readability, apply fix suggested by che=
ckpatch.
> > ---
>=20
> I like the new format, but you need to run checkpatch on your patches.
>=20

True, but this does only 1 of 2 very similar functions.
Ideally both would be done at the same time.

My preference would be to remove the int i and just
dereference rate similar to:

uint r8712_is_cckrates_included(u8 *rate)
{
	while (*rate) {
		u8 r =3D *rate & 0x7f;

		if (r =3D=3D 2 || r =3D=3D 4 || r =3D=3D 11 || r =3D=3D 22)
			return true;
		rate++;
	}

	return false;
}

uint r8712_is_cckratesonly_included(u8 *rate)
{
	while (*rate) {
		u8 r =3D *rate & 0x7f;

		if (r !=3D 2 && r !=3D 4 && r !=3D 11  && r !=3D 22)
			return false;
		rate++;
	}

	return true;
}

though the existing cckratesonly_included function
seemingly returns an incorrect true if the rate array
is empty.


