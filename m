Received: from outbound.pv.icloud.com (p-west1-cluster5-host4-snip4-4.eps.apple.com [57.103.66.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D33BD242
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775048706; cv=none; b=h0pOM6nIjp5EZf50grrsg/fgUOvjfVgi8Tr9TTxC9r4c8/X6v8BZLfcxIJGzlB+NEP/heCO3WbvK/IZbSPpKT5RXKdhU1S7UzillxRgbQIU72BMPW+6cuYiSZvfui5vax3JQgydh+7cHyha/fflcEyb40S4Go/TDp6Yh42WqQ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775048706; c=relaxed/simple;
	bh=BjvVWxnuTZQWdmhwgA3ptWKWuRi0yXZRODPmVE1YBPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSWlgigJC+dweDvH0dbJd3fPsdOrhQTGj4aB+k4U2xPLoLiSAAb2+0VrM4qL26VtnRPL1xRU/No4igNu+Bpi3Wzxt6+ciwG40N6glfHkMhPfTFeIpX0S/X6tsNx2ITpMJN7ZHlCpfdCB4GMpWabTRFveSlSICbgiFgGNk+qWcXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=ZooeR7wJ; arc=none smtp.client-ip=57.103.66.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="ZooeR7wJ"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-9 (Postfix) with ESMTPS id 8B2071800C85;
	Wed, 01 Apr 2026 13:05:00 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1775048704; x=1777640704; bh=L5O67D7d4kwWxHwVs+VmOYIayJ+fAVC2N01j+IFMdb0=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=ZooeR7wJV9M0mw2L4aeKidzxO0MX8gi7MPVm3tDrWxrnxgvniHII1FXJ8kSWDhGmDePIFspkPiVYR7JE8FLElwTx9N6PQ6pnm230PT5m5iCL1sEXIeXYMmE6FuzEE4hsF2LPDZj7PdNmCLzOjyTf/YyRJhHizhkxy9vEsxNIz8gq0YtyO79yYZ2FBsdfVUtpO32XF7ewAJ0I6FT1M+QofrLeB8t7/s9TELoM5yQW6kvxMaCKlXNsTg8sHuI7j+4rbG4E2/p4j3gst0um+narLWSLgsiWjNRDGHpduFWEKwnxqKuqwQec8aUaUjr5RlvNOvOYAbd+kfXixTj97MY50w==
Received: from [172.27.20.101] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-9 (Postfix) with ESMTPSA id 1D92318028E7;
	Wed, 01 Apr 2026 13:03:39 +0000 (UTC)
Message-ID: <45cea1ad-79fb-49c3-a378-e3eeae9239ad@icloud.com>
Date: Wed, 1 Apr 2026 15:03:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: most/net: remove dead code from skb_to_mamac()
 and skb_to_mep()
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260401125711.80822-1-hadichokr@icloud.com>
Content-Language: en-US
From: Hadi Chokr <hadichokr@icloud.com>
In-Reply-To: <20260401125711.80822-1-hadichokr@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyMSBTYWx0ZWRfX1RgaXu5AMEii
 P3hg0ag37B47Mj/ukiQpqEz2l5oL4t5ncPNM+OX9Ny2DzVThftafYTs7yPXpJ6lBQ4vHZIjs5Vd
 nBT7PAJO3ijcbOvhbDKbNM8xtd22QzMmy1VxX293eMYH6vFU77+shRf6pSozgeFwjBMg5H8V3A7
 GYNHKXMUUQdBx6ooG3Ekzkdg+s6Xz27ShebRQqSu5EhAivIIqVBOmLaGVfFozZDLY4y83hS+l4b
 Z4fQayuTfguPNb8t4BWt6CIrXOv/vzBLjzGacnSX4QW5+iLvfFuatngz9Iip1Y+TTbqubTXlmLi
 y3PPanqArJ8v58dwuDfkpN/zr6akuyQdDJUbAKkG9jvJ/KeI5haARtZ9BZKxw4=
X-Authority-Info-Out: v=2.4 cv=TpDrRTXh c=1 sm=1 tr=0 ts=69cd17fd
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=x7bEGLp0ZPQA:10 a=r945xf9LNZYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=xo6fxlqQ1wuLgFIJI90A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CGDpvxjn4StD8Ko6ekltl0GtYtMvY7k9
X-Proofpoint-GUID: CGDpvxjn4StD8Ko6ekltl0GtYtMvY7k9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604010121

On 4/1/26 14:57, Hadi Chokr wrote:
> The overflow checks in skb_to_mamac() and skb_to_mep() are always false:
>
>    mdp_len = (skb->len - ETH_HLEN) + MDP_HDR_LEN = skb->len + 2
>    mep_len = skb->len + MEP_HDR_LEN = skb->len + 8
>
> Remove these checks to clean up the code.
>
> Signed-off-by: Hadi Chokr <hadichokr@icloud.com>
> ---
>   drivers/staging/most/net/net.c | 10 ----------
>   1 file changed, 10 deletions(-)
>
> diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
> index fffdb60cd230..07fd18e9096d 100644
> --- a/drivers/staging/most/net/net.c
> +++ b/drivers/staging/most/net/net.c
> @@ -80,11 +80,6 @@ static int skb_to_mamac(const struct sk_buff *skb, struct mbo *mbo)
>   	unsigned int payload_len = skb->len - ETH_HLEN;
>   	unsigned int mdp_len = payload_len + MDP_HDR_LEN;
>   
> -	if (mdp_len < skb->len) {
> -		pr_err("drop: too large packet! (%u)\n", skb->len);
> -		return -EINVAL;
> -	}
> -
>   	if (mbo->buffer_length < mdp_len) {
>   		pr_err("drop: too small buffer! (%d for %d)\n",
>   		       mbo->buffer_length, mdp_len);
> @@ -132,11 +127,6 @@ static int skb_to_mep(const struct sk_buff *skb, struct mbo *mbo)
>   	u8 *buff = mbo->virt_address;
>   	unsigned int mep_len = skb->len + MEP_HDR_LEN;
>   
> -	if (mep_len < skb->len) {
> -		pr_err("drop: too large packet! (%u)\n", skb->len);
> -		return -EINVAL;
> -	}
> -
>   	if (mbo->buffer_length < mep_len) {
>   		pr_err("drop: too small buffer! (%d for %d)\n",
>   		       mbo->buffer_length, mep_len);
If this email landed twice before, I apologise. I used the wrong mailing 
list domain and am unsure whether the earlier attempts were only 
partially delivered or failed entirely. This is the corrected submission.

Thanks,
Hadi

