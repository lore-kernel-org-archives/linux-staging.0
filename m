Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CACB1DFDC
	for <linux-staging@lists.linux.dev>; Tue, 31 Oct 2023 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id C3EC614054F;
	Tue, 31 Oct 2023 17:37:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id 769DD2E;
	Tue, 31 Oct 2023 17:37:56 +0000 (UTC)
Message-ID: <bb0be69b3d4483a9e8a29bedca9e1117a42e40f9.camel@perches.com>
Subject: Re: [PATCH] staging: vme_user: Added blank line after declarations
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Rohit Chavan
	 <roheetchavan@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga
 <manohar.vanga@gmail.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Date: Tue, 31 Oct 2023 10:37:55 -0700
In-Reply-To: <d94519dc-8e2e-427b-9828-4f714d0561a1@kadam.mountain>
References: <20231031100610.5394-1-roheetchavan@gmail.com>
	 <d94519dc-8e2e-427b-9828-4f714d0561a1@kadam.mountain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: s8hwmqg7or3yfsm3hceq5mpkyw5b89g8
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 769DD2E
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+Y4Lk5Ohe0duQ7Weqxvd7e66sww4hsK+w=
X-HE-Tag: 1698773876-869344
X-HE-Meta: U2FsdGVkX1/+yg2e3ycIbFUpTqfxJW+WHsv8ya/jnYXVh4yCEPg0y+kcguw6Jg+rPpeQixm7CyarqEHh643ZGgo7S9UTy6j55/ajH0Gi4ndmPsDJpPHhA4PpHsoRKzqPYcs1YUtGa8x9Wc2lpYh212UfcxE3OyGjo7oL9oVoSCPSsI2zBOL2i76j46LMRBtRY4MelopTT9Y6J3kxpeqkvqgUQ7Jn/BfFo7Lv9c06nwFs2wmT3ulrAMskVedBeXDo1plGg60xGeJyDFgLdpxS0mi8s7llSlP5OvkNnvuBAsMkjBZ590hj1+tQdi3r9z6LhLrrm1UcJ9b5CFeWMVojxovus+Fgucwo

On Tue, 2023-10-31 at 13:27 +0300, Dan Carpenter wrote:
> On Tue, Oct 31, 2023 at 10:06:10AM +0000, Rohit Chavan wrote:
> > Fixes below warning reported by checkpatch.
> > WARNING: Missing a blank line after declarations
> >=20
> > Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
>=20
> This is a checkpatch false positive.  (It's not "after declarations").
> Just ignore it.
>=20

checkpatch could accept function pointer and function pointer arrays
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 25fdb7fda1128..de1f4962f55d6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1073,6 +1073,7 @@ our $Typecast	=3D qr{\s*(\(\s*$NonptrType\s*\)){0,1}\=
s*};
 # Any use must be runtime checked with $^V
=20
 our $balanced_parens =3D qr/(\((?:[^\(\)]++|(?-1))*\))/;
+our $balanced_brackets =3D qr/(\[(?:[^\[\]]++|(?-1))*\])/;
 our $LvalOrFunc	=3D qr{((?:[\&\*]\s*)?$Lval)\s*($balanced_parens{0,1})\s*}=
;
 our $FuncArg =3D qr{$Typecast{0,1}($LvalOrFunc|$Constant|$String)};
=20
@@ -4107,7 +4108,7 @@ sub process {
 			# looks like a declaration
 			    !($sl =3D~ /^\+\s+$Declare\s*$Ident\s*[=3D,;:\[]/ ||
 			# function pointer declarations
-			      $sl =3D~ /^\+\s+$Declare\s*\(\s*\*\s*$Ident\s*\)\s*[=3D,;:\[\(]/ =
||
+			      $sl =3D~ /^\+\s+$Declare\s*\(\s*\*\s*$Ident(?:\s*$balanced_bracke=
ts)*\s*\)\s*[=3D,;:\[\(]/ ||
 			# foo bar; where foo is some local typedef or #define
 			      $sl =3D~ /^\+\s+$Ident(?:\s+|\s*\*\s*)$Ident\s*[=3D,;\[]/ ||
 			# known declaration macros

