Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE139FD4
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 20:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776197408; cv=none; b=gMhJ1WQQzz2HKWQuBoHsGC7hQip1lR75ElGssoNte9L8Mk0V7T9w4QUvyHJXhXt6TLJk7IMpXB2EkFd6iikJ3wIPQemmQfWkFm9a3RFFFqkCB4a0+aj6AT1Kd4TtpEH8SjKC6K7srwASEkwMkZHlkQasON1J/2lW5XlInefoZGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776197408; c=relaxed/simple;
	bh=xj0lP2rxUEG2reVuKW25tDt0SU4T4EFFrC06qwFj+uw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o/NAwBmzU5ersoPC29iaF0lyJ0WWeV9mwWPOD8lsoGuZd7s2xNTt+eSekBzVR/HUhOje5dU9+AoG2oags41n0WOitOyD6zd/7sviVcHOLyjRYxq+7I+O/yz7pH9mj+xDvAYpG7gq0VmwtpluPOhXHwVJwChPXzdXUj5SvV8kxG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id DE863B6F0C;
	Tue, 14 Apr 2026 20:09:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id E9FAC17;
	Tue, 14 Apr 2026 20:09:57 +0000 (UTC)
Message-ID: <ab7fbf1b8bd1e6d8ff15fc5edd7e15bb79fd39ce.camel@perches.com>
Subject: Re: [PATCH v3] staging: vme_user: add blank lines to struct
 fake_driver
From: Joe Perches <joe@perches.com>
To: Souradipto Das <souradiptodas6@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 14 Apr 2026 13:09:56 -0700
In-Reply-To: <20260414173754.22890-1-souradiptodas6@gmail.com>
References: <20260414173754.22890-1-souradiptodas6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: E9FAC17
X-Stat-Signature: x4ubgc3t4n7a3z91n36nr818qximwy73
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+LD7SuGq/VxCwuUstiYftMn847UXsb0YQ=
X-HE-Tag: 1776197397-675359
X-HE-Meta: U2FsdGVkX18Ok5qqg9/MthqhGvoqqjoWmJwNJcXfVvdQ3YlNLRi90mUh6pFE1fyA9Xhn0TgoZgXZYz9g17tFELfG61YksG0r7DTp5LjS7ik7spFoi82VsHZ/DL1A0ZA/5JwhlC+sr+gJhTQjLZSfNHBIqvM+ywfvqerHER6r3yoiIZMLFf5DHQtU9MyKOV4xNNV9LWnIdxcEMOPC9vmC9obLWuBrxJyKK7dmpvEjqFpR8PFPzUFz1OERJYcZnSJ6RLTHvOTijSdhORN+Ob8UAhZV7LEPj3PBHZfxQDsaAgBWhOErZpv7OWsiHHJ77xkVg8pHKL9041sItN9WKqjF8FkrQXIBtde3

On Tue, 2026-04-14 at 17:37 +0000, Souradipto Das wrote:
> Fix checkpatch.pl warnings regarding missing blank lines after
> declarations. This improves readability by grouping related
> Location Monitor variables together.
>=20
> Signed-off-by: Souradipto Das <[souradiptodas6@gmail.com](mailto:souradip=
todas6@gmail.com)>
> ---
>=20
> v3:
>   - Added this changelog (missing in v2).
>   - No changes to code itself.
> v2:
>   - Fixed author name/email to use real identity.
>  =20
>  drivers/staging/vme_user/vme_fake.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_us=
er/vme_fake.c
> index be4ad47ed526..7ec14bf15fbe 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -67,8 +67,10 @@ struct fake_driver {
>  	unsigned long long lm_base;
>  	u32 lm_aspace;
>  	u32 lm_cycle;
> +
>  	void (*lm_callback[4])(void *);
>  	void *lm_data[4];
> +
>  	struct tasklet_struct int_tasklet;
>  	int int_level;
>  	int int_statid;

The first blank line is a checkpatch false positive.
The second is not necessary.

