Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D381C2F2E
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:54:01 +0000 (UTC)
Received: (Authenticated sender: didi.debian@cknow.org)
	by mail.gandi.net (Postfix) with ESMTPSA id AF2B7FF804;
	Mon, 23 Jan 2023 12:53:52 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Fix full name of the GPL
Date: Mon, 23 Jan 2023 13:53:51 +0100
Message-ID: <18246331.B5QXJUBsVf@prancing-pony>
Organization: Connecting Knowledge
In-Reply-To: <20230122191047.58769-1-didi.debian@cknow.org>
References: <20230122191047.58769-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart14116726.01SpmRQWAs";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart14116726.01SpmRQWAs
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Fix full name of the GPL
Date: Mon, 23 Jan 2023 13:53:51 +0100
Message-ID: <18246331.B5QXJUBsVf@prancing-pony>
Organization: Connecting Knowledge
In-Reply-To: <20230122191047.58769-1-didi.debian@cknow.org>
References: <20230122191047.58769-1-didi.debian@cknow.org>
MIME-Version: 1.0

On Sunday, 22 January 2023 20:10:47 CET Diederik de Haas wrote:
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> ---
>  drivers/staging/wlan-ng/hfa384x.h          | 4 ++--
>  ...
>  drivers/staging/wlan-ng/prism2sta.c        | 4 ++--
>  21 files changed, 42 insertions(+), 42 deletions(-)

Please disregard this patch.
Next to 'style' issues, I now consider my initial view of the issue as a 
spelling error, incorrect. I would be changing the license and IANAL. I'm also 
not the copyright holder which I believe is needed to change the license.

Apologies for the noise.
--nextPart14116726.01SpmRQWAs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCY86DXwAKCRDXblvOeH7b
brraAQCIOPwlTSoqolrKKXtf0E+9+a6QTOvMNXcguwRS1aS2PAD/W/YdL4NpdoHA
YhwkNiGoYpYZmZMmGDllFZAjaiaXogc=
=aVxP
-----END PGP SIGNATURE-----

--nextPart14116726.01SpmRQWAs--



