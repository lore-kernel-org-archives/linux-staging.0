Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFDA7C;
	Tue,  1 Nov 2022 13:32:26 +0000 (UTC)
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 73062140A19;
	Tue,  1 Nov 2022 13:32:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id A231B20010;
	Tue,  1 Nov 2022 13:31:27 +0000 (UTC)
Message-ID: <ea1476128e2f21956ad99e52b01f0c99f46e70ba.camel@perches.com>
Subject: Re: [PATCH v2 1/2] change the function name s_vFillRTSHead
From: Joe Perches <joe@perches.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, 
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Date: Tue, 01 Nov 2022 06:32:15 -0700
In-Reply-To: <ea25c687d28f5cf40c315b8191d98fa0608f8a76.1667305446.git.tanjubrunostar0@gmail.com>
References: <cover.1667305446.git.tanjubrunostar0@gmail.com>
	 <ea25c687d28f5cf40c315b8191d98fa0608f8a76.1667305446.git.tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.00
X-Stat-Signature: bqygm3jsbejrzbgd6drrra7iuu8fj6wi
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: A231B20010
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19vCoHjt09qItJOcQk9xglaTnJ4aqTq5NI=
X-HE-Tag: 1667309487-134588

On Tue, 2022-11-01 at 12:37 +0000, Tanjuate Brunostar wrote:
> Remove the use of Hungarian notation, which is not used in the Linux
> kernel. Reported by checkpatch
[]
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.=
c
[]
> @@ -23,7 +23,7 @@
>   *      s_uGetTxRsvTime- get frame reserved time
>   *      s_vFillCTSHead- fulfill CTS ctl header
>   *      s_vFillFragParameter- Set fragment ctl parameter.
> - *      s_vFillRTSHead- fulfill RTS ctl header
> + *      fill_rts_head- fulfill RTS ctl header

Perhaps use header as head is conventionally used in lists.

	fill_rts_header

