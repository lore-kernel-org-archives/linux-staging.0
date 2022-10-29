Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E902574;
	Sat, 29 Oct 2022 15:56:17 +0000 (UTC)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 783E3C0110;
	Sat, 29 Oct 2022 14:38:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id DCF0717;
	Sat, 29 Oct 2022 14:37:55 +0000 (UTC)
Message-ID: <efab1f11d5008188988813e3f3c27ce1297e71c0.camel@perches.com>
Subject: Re: [PATCH] Remove Unnecessary typecast of c90 int constant
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>, UMWARI JOVIAL
 <umwarijovial@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Date: Sat, 29 Oct 2022 07:38:10 -0700
In-Reply-To: <alpine.DEB.2.22.394.2210280918550.2845@hadrien>
References: <20221028063711.GA35659@rdm>
	 <alpine.DEB.2.22.394.2210280918550.2845@hadrien>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: DCF0717
X-Spam-Status: No, score=-4.58
X-Stat-Signature: 3kpugo777z3hb3xfdrd5mryxt7uasajh
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18BJ6iGaBQ/gDxUl5GMVObh7DN5jwxKBPo=
X-HE-Tag: 1667054275-197456

On Fri, 2022-10-28 at 09:22 +0200, Julia Lawall wrote:
>=20
> On Fri, 28 Oct 2022, UMWARI JOVIAL wrote:
>=20
> > According to Linux kernel coding style.
> >=20
> > Reported by checkpatch:
> > WARNING: Unnecessary typecast of c90 int constant - '(int)2.412e8' coul=
d be '2.412e8'
> > WARNING: Unnecessary typecast of c90 int constant - '(int)2.487e8' coul=
d be '2.487e8'
>=20
> It's not ideal to just include the checkpatch messges verbatim in your lo=
g
> message.  It woudl be better to say what you are doing and why, in
> complete sentences ("According to the Linux coding style" is not a
> complete sentence).
>=20
> I also suspect that the checkpatch message is wrong.  Floating point
> numbers cannot be used in the kernel, and the case of the constant ensure=
s
> that the value will be converted to an integer at compile time.

Yes, it's a checkpatch defect.

checkpatch should have this:
---
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4e187202e77a6..9958a774efaf1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6758,7 +6759,8 @@ sub process {
                }
=20
 # check for cast of C90 native int or longer types constants
-               if ($line =3D~ /(\(\s*$C90_int_types\s*\)\s*)($Constant)\b/=
) {
+               if ($line =3D~ /(\(\s*$C90_int_types\s*\)\s*)($Constant)\b/=
 &&
+                   $2 !~ /^$Float$/) {
                        my $cast =3D $1;
                        my $const =3D $2;
                        my $suffix =3D "";

