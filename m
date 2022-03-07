Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A8938C9
	for <linux-staging@lists.linux.dev>; Mon,  7 Mar 2022 07:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9EAC340EF;
	Mon,  7 Mar 2022 07:28:35 +0000 (UTC)
Message-ID: <818eb53d-0ca5-d0dc-4a06-37615a5c4c3b@xs4all.nl>
Date: Mon, 7 Mar 2022 08:28:34 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] media: av7110: av7110_av: Fix Switch and Case Same Indent
 Style Error
Content-Language: en-US
To: Husni Faiz <ahamedhusni73@gmail.com>, mchehab@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220225155622.585621-1-ahamedhusni73@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220225155622.585621-1-ahamedhusni73@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Husni,

Thank you for the patch.

The Subject line needs some work: either name the source ('av7110_av.c:') or
driver ('av7110:'), but not both. Also just stick to lower case, so:
"media: av7110_av.c: fix switch indentation"

That gives all the relevant information, and is a lot shorter.

On 2/25/22 16:56, Husni Faiz wrote:
> This patch fixes "switch and case should be at the same indent"
> checkpatch error.
> 
> Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110_av.c | 30 ++++++++++++------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
> index 91f4866c7e59..1d42862e9669 100644
> --- a/drivers/staging/media/av7110/av7110_av.c
> +++ b/drivers/staging/media/av7110/av7110_av.c
> @@ -770,22 +770,22 @@ static void p_to_t(u8 const *buf, long int length, u16 pid, u8 *counter,
>  	if (length > 3 &&
>  	     buf[0] == 0x00 && buf[1] == 0x00 && buf[2] == 0x01)
>  		switch (buf[3]) {
> -			case PROG_STREAM_MAP:
> -			case PRIVATE_STREAM2:
> -			case PROG_STREAM_DIR:
> -			case ECM_STREAM     :
> -			case EMM_STREAM     :
> -			case PADDING_STREAM :
> -			case DSM_CC_STREAM  :
> -			case ISO13522_STREAM:
> -			case PRIVATE_STREAM1:
> -			case AUDIO_STREAM_S ... AUDIO_STREAM_E:
> -			case VIDEO_STREAM_S ... VIDEO_STREAM_E:
> -				pes_start = 1;
> -				break;
> +		case PROG_STREAM_MAP:
> +		case PRIVATE_STREAM2:
> +		case PROG_STREAM_DIR:
> +		case ECM_STREAM     :
> +		case EMM_STREAM     :
> +		case PADDING_STREAM :
> +		case DSM_CC_STREAM  :
> +		case ISO13522_STREAM:
> +		case PRIVATE_STREAM1:
> +		case AUDIO_STREAM_S ... AUDIO_STREAM_E:
> +		case VIDEO_STREAM_S ... VIDEO_STREAM_E:
> +			pes_start = 1;
> +			break;
>  
> -			default:
> -				break;
> +		default:
> +			break;
>  		}
>  
>  	while (c < length) {

Running checkpatch.pl over this patch give me:

ERROR: space prohibited before that ':' (ctx:WxE)
#40: FILE: drivers/staging/media/av7110/av7110_av.c:776:
+               case ECM_STREAM     :
                                    ^

ERROR: space prohibited before that ':' (ctx:WxE)
#41: FILE: drivers/staging/media/av7110/av7110_av.c:777:
+               case EMM_STREAM     :
                                    ^

ERROR: space prohibited before that ':' (ctx:WxE)
#42: FILE: drivers/staging/media/av7110/av7110_av.c:778:
+               case PADDING_STREAM :
                                    ^

ERROR: space prohibited before that ':' (ctx:WxE)
#43: FILE: drivers/staging/media/av7110/av7110_av.c:779:
+               case DSM_CC_STREAM  :
                                    ^
Can you fix that as well in a v2 of this patch?

Thanks!

	Hans
