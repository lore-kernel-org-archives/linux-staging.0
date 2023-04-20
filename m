Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E898BE9
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1682000802; i=markus.elfring@web.de;
	bh=mS96S/D3VxT1QwzkvJSRFzUdWylAm6eWxlYkrFWxbDA=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=q55VJIgTpLpSlvMfA1hR0FM3Run/TUnL0SE0Uh9U1glgkjinfNia+yxeUsp643stw
	 ktaxQWfGSilllvXwXiCTaWkk5xX1bwVVMBO+8Nv1y+P+HJcmjV53IzeXxUxmIYf6Yt
	 vXDHLIam+lLQvdoU1MUqlcBBJRpWWzF7Nnr3KrwWD4byPC9JOOxJ/Kvwd2RXHp9amD
	 5vLA+pf3ApQ1BVh0/hQ6dFnIb0oJ1VD+kVN62JPJTqI3VD7zJrjvbTBjE1eUs77Suj
	 oNLcZ3K6uj9f+5Jk+ja71qemB2zYYsYD/1Rw1lPEkr386rYc/rjed3oDO2WG0ywsrE
	 pxZ/+BtCBLtzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mty5w-1qASwY2You-00uPgT; Thu, 20
 Apr 2023 16:26:42 +0200
Message-ID: <1f72786d-7ef2-80fa-58d2-98e379dd8ad7@web.de>
Date: Thu, 20 Apr 2023 16:26:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 0/4] staging: rtl8723bs: Adjustments for
 rtw_set_802_11_bssid_list_scan()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev,
 Emily Peri <eperi1024@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WrrfdeOS9UDeQKKM8UNcpzRNWrli/gIZw1b7/kMkbLtQ6Spubqs
 mMZWPHd4eHr2Opt+I9fGcOcbdI/N4ljB6kCW4vxM6gS9OvB7esW77RWDvRFHs7O9YTDdm50
 1wL8ghjms9PE+4s8upc/d9AKAKG4wardgroRTe4dnVDH/rTcFnn8HiM/ELCzkWEEHQW4SKe
 6nfeGMDonUDgge8rrFISQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0nIB/MbAnIg=;g5KoQTBnU0cA5IFavBTr3yeO1EZ
 oCtjcC+eYdsxmOWGkRKh6l6HF/MTEig7BvMoKbAzObS7DXUPumj8WdwasMavhpI5uvYnnW6/P
 5kCTiPych1Z4tyS7rElSJDX8mzlIjQPzluouN8I6tjR/9+DmhIc75LyLMXaD/OKCbzUbTfgGD
 fEl52cXf+u66nGtC0DvG+CGbmA/OxVpn1nIIyUcoB9tCYg3E7PQLUN/yDoQ+YrY4NCxWrXo16
 f91mE8+X926rwYGl9BzeyUh/x1OyMWWT/SXiNhni5gVRygb8dpHkHeTFEcdPalOd0CVqi/smC
 ZJ3iZMkLRbb4fKwpaUSmQ8omkE29jgKFm+/d2YPcB47j1avhQ9LK4TWg0LUYk3e597OyCY0Bp
 wAJssGnUY9jKO3NNqHgCksDPneRaxdKVG9DgtitFJSMOY7oHTV3LEM34dNMGDCW56RyqcHt67
 fJBtKIRFYSvPBKhZFboED90qqDnCOK7d+vlDu5FpoPIuAoQsTaV9Gm+bjEeio0B3ru4cIM3PM
 S6Ic7/Ayn7gzrbwdQYtz4dYN+4rPvebgpSqWp6moXumj1GGEBUKtojZudb8a+GMbTsxetVjzB
 5Z8lmuuyjUtYAQgakPuYEC8Csq79Nz42CFu8+ek3g0LtS/U4wrPzPLtUuWckT3NUMMXHUiWXK
 Aibb8C/C+6Ea56OUG3zuq9wo92t9dkBUpr+1Rv5yNK4Vc3kd1cL+fuGV1xWSm2WdAU/+xRTYy
 fmZs5UMLjEdsH3CzZwzk9jysyJb58xBtbTT6Z+lMmky8dgiMShKi+oJD9Aifpo0ZxwbJqhI4R
 YdCo1B1EK4GsQHDTpOrrd/BEptcGwCZgGt9vvGhGR3HXKqi1Kr1Fy+CVYBWSZLuKYuhwdn5HT
 1oBXUCp07Zd0qlS8L3vmB7e6z27/Xb/3OQqwoFLUyG+I/movq9jK9vPZr

Date: Thu, 20 Apr 2023 16:16:32 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete a null pointer check
  Return directly after a failed initialisation check
  Delete an unnecessary variable initialisation
  Move a variable assignment behind a condition check

 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

=2D-
2.40.0

