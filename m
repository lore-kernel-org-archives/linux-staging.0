Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03E70
	for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 19:29:29 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luKB2-009jVk-HT; Fri, 18 Jun 2021 19:29:16 +0000
Date: Fri, 18 Jun 2021 19:29:16 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jhih-Ming Huang <fbihjmeric@gmail.com>
Cc: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, maqianga@uniontech.com,
	marcocesati@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rtw_security: fix cast to restricted __le32
Message-ID: <YMz0DH0+v39xsCYU@zeniv-ca.linux.org.uk>
References: <YMeL7PjstV601pbN@zeniv-ca.linux.org.uk>
 <20210618181751.95967-1-fbihjmeric@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618181751.95967-1-fbihjmeric@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, Jun 19, 2021 at 02:17:51AM +0800, Jhih-Ming Huang wrote:
> This patch fixes the sparse warning of fix cast to restricted __le32.
> 
> There was a change for replacing private CRC-32 routines with in kernel
> ones.
> However, the author used le32_to_cpu to convert crc32_le(), and we
> should cpu_to_le32.
> 
> Ths commit also fixes the payload checking by memcmp instead of checking element
> by element.
> 
> Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index a99f439328f1..97a7485f8f58 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -121,7 +121,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
>  		arc4_crypt(ctx, payload, payload,  length);
>  
>  		/* calculate icv and compare the icv */
> -		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> +		*crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));

Huh?  crc is u8[4]; that assignment will truncate that le32 to u8 and store it in
the first byte of your 4-element array.  How the hell does sparse *not* complain
on that?

Either make crc __le32 (and turn assignment into crc = cpu_to_le32(...)), or
make that *(__le32 *)crc = ...

> @@ -618,10 +618,9 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
>  			arc4_setkey(ctx, rc4key, 16);
>  			arc4_crypt(ctx, payload, payload, length);
>  
> -			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
> +			*crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));

Ditto.  Declare crc as __le32 and use
			crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
here.
